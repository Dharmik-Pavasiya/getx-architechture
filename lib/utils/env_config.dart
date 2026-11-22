/// Compile-time configuration that keeps credentials out of source control.
class EnvConfig {
  EnvConfig._();

  /// Override with `--dart-define=BASE_URL=https://api.example.com`.
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://jsonplaceholder.typicode.com',
  );
}
