// Acceso a Google desde el servidor: renovación del token y listas de Classroom.
// Nada de lo que pasa por aquí se guarda.

const TOKEN_URL = "https://oauth2.googleapis.com/token";
const CLASSROOM_BASE = "https://classroom.googleapis.com/v1";
const MAX_PAGES = 50;
const RETRYABLE = new Set([429, 500, 502, 503, 504]);

class TokenError extends Error {
  constructor(reason, reconnect) {
    super(reason);
    this.reconnect = reconnect;
  }
}

async function readJson(res) {
  try {
    return await res.json();
  } catch (e) {
    return null;
  }
}

function createTokenProvider({clientId, clientSecret, fetchImpl, now = Date.now}) {
  const cache = new Map();

  return async function accessTokenFor(studentId, refreshToken) {
    const cached = cache.get(studentId);
    if (cached && cached.refreshToken === refreshToken && cached.expiresAt > now() + 60000) {
      return cached.token;
    }

    let res;
    try {
      res = await fetchImpl(TOKEN_URL, {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: new URLSearchParams({
          client_id: clientId,
          client_secret: clientSecret(),
          refresh_token: refreshToken,
          grant_type: "refresh_token",
        }),
      });
    } catch (e) {
      throw new TokenError("token_network_error", false);
    }

    const body = await readJson(res);
    if (!res.ok || !body || !body.access_token) {
      cache.delete(studentId);
      const reason = (body && body.error) || `token_http_${res.status}`;
      throw new TokenError(reason, reason === "invalid_grant");
    }

    cache.set(studentId, {
      token: body.access_token,
      refreshToken,
      expiresAt: now() + (Number(body.expires_in) || 3600) * 1000,
    });
    return body.access_token;
  };
}

// Canjea el código que devuelve Google por los tokens. Nunca lanza.
async function exchangeCode({code, clientId, clientSecret, redirectUri, fetchImpl}) {
  let res;
  try {
    res = await fetchImpl(TOKEN_URL, {
      method: "POST",
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: new URLSearchParams({
        code,
        client_id: clientId,
        client_secret: clientSecret(),
        redirect_uri: redirectUri,
        grant_type: "authorization_code",
      }),
    });
  } catch (e) {
    return {ok: false, reason: "token_network_error"};
  }
  const body = await readJson(res);
  if (!res.ok || !body || !body.access_token) {
    return {ok: false, reason: (body && body.error) || `token_http_${res.status}`};
  }
  return {ok: true, body};
}

// Pide una lista de Classroom con todas sus páginas. Si Google está saturado,
// reintenta una vez. Nunca lanza: devuelve {ok, status, items}.
async function listAll({path, params = {}, listKey, token, fetchImpl, sleep}) {
  const items = [];
  let pageToken = null;

  for (let page = 0; page < MAX_PAGES; page++) {
    const query = new URLSearchParams(params);
    if (pageToken) query.set("pageToken", pageToken);
    const url = `${CLASSROOM_BASE}${path}?${query}`;
    const options = {headers: {Authorization: `Bearer ${token}`}};

    let res;
    try {
      res = await fetchImpl(url, options);
      if (RETRYABLE.has(res.status)) {
        await sleep(1000);
        res = await fetchImpl(url, options);
      }
    } catch (e) {
      return {ok: false, status: 503, items};
    }

    const body = await readJson(res);
    if (!res.ok) return {ok: false, status: res.status, items};
    if (!body || typeof body !== "object") return {ok: false, status: 502, items};

    const pageItems = body[listKey];
    if (pageItems !== undefined && !Array.isArray(pageItems)) {
      return {ok: false, status: 502, items};
    }
    items.push(...(pageItems || []));

    pageToken = body.nextPageToken;
    if (!pageToken) return {ok: true, status: 200, items};
  }

  return {ok: false, status: 507, items};
}

module.exports = {TokenError, createTokenProvider, exchangeCode, listAll};
