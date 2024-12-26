enum AppEnvironment { DEV, STAGING, PROD }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;
  static String get envName => _environment._envName;
  static String get baseURL => _environment._baseURL;

  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.PROD;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.DEV: 'Refugee Mobile App Dev',
    AppEnvironment.STAGING: 'Refugee Mobile App Staging',
    AppEnvironment.PROD: 'Refugee Mobile App',
  };

  static const _baseURLs = {
    AppEnvironment.DEV: 'https://dd',
    AppEnvironment.STAGING: 'https://dd',
    AppEnvironment.PROD: 'https://dd',
  };

  static const _envs = {
    AppEnvironment.DEV: 'dev',
    AppEnvironment.STAGING: '', // todo add "staging"
    AppEnvironment.PROD: '',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _baseURL => _baseURLs[this]!;
}
