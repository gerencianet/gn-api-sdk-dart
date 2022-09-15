import 'constants.dart';

/// This class is used to create an Object with all needed configurations used in
/// Gerencianet API. This configurations include the Endpoints and URLs of
/// Gerencianet API, and credential data of Gerencianet client.

class Config {
  static final String version = "1.2.2";
  Map conf = {};

  static final Config _singleton = Config._internal();

  factory Config() {
    return _singleton;
  }

  Config._internal();

  set(Map options) {
    this.conf['sandbox'] =
        options.containsKey('sandbox') ? options['sandbox'] : false;

    this.conf['debug'] =
        options.containsKey('debug') ? options['debug'] : false;

    this.conf['clientId'] = options['client_id'];

    if (options.containsKey('account_id'))
      conf['accountId'] = options['account_id'];

    this.conf['clientSecret'] = options['client_secret'];

    this.conf['timeout'] =
        options.containsKey('timeout') ? options['timeout'] : 30.0;

    if (options.containsKey('certificate'))
      this.conf['certificate'] = options['certificate'];

    if (options.containsKey('private_key'))
      this.conf['privateKey'] = options['private_key'];

    if (options.containsKey('partner_token'))
      this.conf['partnerToken'] = options['partner_token'];

    if (options.containsKey('headers')) conf['headers'] = options['headers'];
  }

  getEndpoint(endpointName) {
    if (CONSTANTS['DEFAULT']?['ENDPOINTS'][endpointName] != null) {
      this.setBaseURL('DEFAULT');
      return CONSTANTS['DEFAULT']?['ENDPOINTS'][endpointName];
    } else if (CONSTANTS['PIX']?['ENDPOINTS'][endpointName] != null) {
      this.setBaseURL('PIX');
      return CONSTANTS['PIX']?['ENDPOINTS'][endpointName];
    } else if (CONSTANTS['OPEN-FINANCE']?['ENDPOINTS'][endpointName] != null) {
      this.setBaseURL('OPEN-FINANCE');
      return CONSTANTS['OPEN-FINANCE']?['ENDPOINTS'][endpointName];
    } else if (CONSTANTS['PAGAMENTOS']?['ENDPOINTS'][endpointName] != null) {
      this.setBaseURL('PAGAMENTOS');
      return CONSTANTS['PAGAMENTOS']?['ENDPOINTS'][endpointName];
    } else if (endpointName == 'paymentToken') {
      this.setBaseURL('DEFAULT');
    } else {
      throw new Exception("nonexistent endpoint");
    }
  }

  setBaseURL(api) {
    if (this.conf['sandbox']) {
      this.conf['baseUri'] = CONSTANTS[api]?['URL']['sandbox'];
    } else {
      this.conf['baseUri'] = CONSTANTS[api]?['URL']['production'];
    }
  }
}
