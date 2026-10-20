const {onRequest} = require("firebase-functions/v2/https");
const {defineSecret} = require("firebase-functions/params");
const logger = require("firebase-functions/logger");
const {initializeApp} = require("firebase-admin/app");
const {getAuth} = require("firebase-admin/auth");
const {getFirestore, FieldValue} = require("firebase-admin/firestore");
const {createTokenProvider, exchangeCode} = require("./google");
const {createSyncHandler} = require("./sync");
const {createOnboardingEmailHandler} = require("./email");
const {createRemoveStudentHandler} = require("./remove");
const {createConnectHandler, createCallbackHandler} = require("./connect");

initializeApp();

// Mismo cliente OAuth que aprobaron los colegios; nunca cambiarlo.
const GOOGLE_CLIENT_ID =
  "633677209986-ts4b909gjsck167qvvhcfvd94kockufa.apps.googleusercontent.com";
const GOOGLE_CLIENT_SECRET = defineSecret("GOOGLE_OAUTH_CLIENT_SECRET");
const LOOPS_API_KEY = defineSecret("LOOPS_API_KEY");

// Dirección a la que vuelve Google. Va en el dominio de Firebase que el cliente
// OAuth ya tiene autorizado (lo usa el inicio de sesión con Google).
const REDIRECT_URI = "https://class-retriever-42b99.firebaseapp.com/callback";

const accessTokenFor = createTokenProvider({
  clientId: GOOGLE_CLIENT_ID,
  clientSecret: () => GOOGLE_CLIENT_SECRET.value(),
  fetchImpl: fetch,
});

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

exports.sync = onRequest(
  {secrets: [GOOGLE_CLIENT_SECRET], invoker: "public", maxInstances: 10, timeoutSeconds: 120},
  createSyncHandler({
    auth: getAuth(),
    db: getFirestore(),
    accessTokenFor,
    fetchImpl: fetch,
    logger,
    sleep,
  }),
);

exports.onboardingEmail = onRequest(
  {secrets: [LOOPS_API_KEY], invoker: "public", maxInstances: 5},
  createOnboardingEmailHandler({
    auth: getAuth(),
    loopsKey: () => LOOPS_API_KEY.value(),
    fetchImpl: fetch,
    logger,
  }),
);

exports.removeStudent = onRequest(
  {invoker: "public", maxInstances: 5},
  createRemoveStudentHandler({
    auth: getAuth(),
    db: getFirestore(),
    arrayRemove: (value) => FieldValue.arrayRemove(value),
    fetchImpl: fetch,
    logger,
  }),
);

exports.connect = onRequest(
  {secrets: [GOOGLE_CLIENT_SECRET], invoker: "public", maxInstances: 10},
  createConnectHandler({
    db: getFirestore(),
    accessTokenFor,
    arrayUnion: (value) => FieldValue.arrayUnion(value),
    clientId: GOOGLE_CLIENT_ID,
    redirectUri: REDIRECT_URI,
    logger,
  }),
);

exports.callback = onRequest(
  {secrets: [GOOGLE_CLIENT_SECRET], invoker: "public", maxInstances: 10},
  createCallbackHandler({
    db: getFirestore(),
    arrayUnion: (value) => FieldValue.arrayUnion(value),
    logger,
    clientId: GOOGLE_CLIENT_ID,
    exchange: (code) => exchangeCode({
      code,
      clientId: GOOGLE_CLIENT_ID,
      clientSecret: () => GOOGLE_CLIENT_SECRET.value(),
      redirectUri: REDIRECT_URI,
      fetchImpl: fetch,
    }),
  }),
);
