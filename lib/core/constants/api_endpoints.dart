class ApiEndpoints {
  ApiEndpoints._();

  // Production Render Backend URL
  static const String baseUrl = 'https://bold-trading-platform.onrender.com/v1';
  static const String wsStreamUrl = 'wss://bold-trading-platform.onrender.com/v1/stream/market';

  // Auth & Workspace
  static const String otpRequest = '$baseUrl/auth/otp/request';
  static const String otpVerify = '$baseUrl/auth/otp/verify';
  static const String me = '$baseUrl/me';
  static const String entitlements = '$baseUrl/entitlements';

  // Market Data
  static const String marketStatus = '$baseUrl/market/status';
  static const String searchInstruments = '$baseUrl/instruments/search';
  static const String quotes = '$baseUrl/market/quotes';
  static const String candles = '$baseUrl/market/candles';
  static const String indices = '$baseUrl/market/indices';
  static const String optionChain = '$baseUrl/market/option-chain';

  // Scanner & Research
  static const String scanners = '$baseUrl/scanners';
  static const String alerts = '$baseUrl/alerts';
  static const String researchInstrument = '$baseUrl/research/instruments';
  static const String aiResearchAsk = '$baseUrl/research/ask';

  // Algo & Paper Trading
  static const String strategies = '$baseUrl/strategies';
  static const String backtests = '$baseUrl/backtests';
  static const String paperAccounts = '$baseUrl/paper/accounts';
  static const String paperOrders = '$baseUrl/paper/orders';
  static const String paperPositions = '$baseUrl/paper/positions';
  static const String paperLedger = '$baseUrl/paper/ledger';
  static const String signals = '$baseUrl/signals';

  // Brokers & Admin
  static const String brokers = '$baseUrl/brokers';
  static const String adminFeedHealth = '$baseUrl/admin/feed-health';
  static const String adminAudit = '$baseUrl/admin/audit';
}
