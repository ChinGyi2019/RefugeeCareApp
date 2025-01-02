enum AppEnvironment { DEV, STAGING, PROD }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;
  static String get envName => _environment._envName;
  static String get baseURL => _environment._baseURL;
  static String get databaseId => _environment._databaseID;
  static String get buckedId => _environment._bucketID;
  static String get projectId => _environment._projectID;
  static String get cardCollectionId => _environment._cardCollectionID;
  static String get communityCollectionId =>
      _environment._communityCollectionID;
  static String get notificationCollectionId =>
      _environment._notificationCollectionId;

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
    AppEnvironment.DEV: 'https://cloud.appwrite.io/v1',
    AppEnvironment.STAGING: 'https://cloud.appwrite.io/v1',
    AppEnvironment.PROD: 'https://cloud.appwrite.io/v1',
  };

  static const _projectIDs = {
    AppEnvironment.DEV: '6768e2a2002cc414437a',
    AppEnvironment.STAGING: '6768e2a2002cc414437a',
    AppEnvironment.PROD: '6768e2a2002cc414437a',
  };

  static const _databaseIDs = {
    AppEnvironment.DEV: '676a4f1e0029e8b78a68',
    AppEnvironment.STAGING: '676a4f1e0029e8b78a68',
    AppEnvironment.PROD: '676a4f1e0029e8b78a68',
  };

  static const _cardCollectionIDs = {
    AppEnvironment.DEV: '676a8770001cd5266ac1',
    AppEnvironment.STAGING: '676a8770001cd5266ac1',
    AppEnvironment.PROD: '676a8770001cd5266ac1',
  };

  static const _communityCollectionIDs = {
    AppEnvironment.DEV: '676a54230037f9fac29a',
    AppEnvironment.STAGING: '676a54230037f9fac29a',
    AppEnvironment.PROD: '676a54230037f9fac29a',
  };
  static const _notificationCollectionIDs = {
    AppEnvironment.DEV: '676a8b03003277c52791',
    AppEnvironment.STAGING: '676a8b03003277c52791',
    AppEnvironment.PROD: '676a8b03003277c52791',
  };

  static const _bucketIDs = {
    AppEnvironment.DEV: '676adf7a00058a4f41c3',
    AppEnvironment.STAGING: '676adf7a00058a4f41c3',
    AppEnvironment.PROD: '676adf7a00058a4f41c3',
  };

  static const _envs = {
    AppEnvironment.DEV: 'dev',
    AppEnvironment.STAGING: 'staging', // todo add "staging"
    AppEnvironment.PROD: '',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _baseURL => _baseURLs[this]!;
  String get _databaseID => _databaseIDs[this]!;
  String get _cardCollectionID => _cardCollectionIDs[this]!;
  String get _communityCollectionID => _communityCollectionIDs[this]!;
  String get _bucketID => _bucketIDs[this]!;
  String get _projectID => _projectIDs[this]!;
  String get _notificationCollectionId => _notificationCollectionIDs[this]!;
}
