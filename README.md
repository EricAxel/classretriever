# Class Retriever Published Version in Stores-Nov 2025

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

## Local OAuth configuration

OAuth values are read through `String.fromEnvironment`. Copy
`config/oauth.example.json` to `config/oauth.local.json` and supply your values.
The local file is excluded from Git. Run Flutter with:

```sh
flutter run --dart-define-from-file=config/oauth.local.json
```

Use the same flag with `flutter build` for local builds that need these values.
Without this configuration, the corresponding values are empty and OAuth token
requests will not work.

This keeps credentials out of Git, but Dart defines are embedded in compiled
applications. Production OAuth client secrets and token exchanges must live on a
backend. This configuration change does not implement that backend migration.
