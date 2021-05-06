import 'package:gerencianet/constants.dart';

class Config {
  static final String version = "1.0.0";

  static options(Map options) {
    dynamic conf = {};

    conf['sandbox'] =
        options.containsKey('sandbox') ? options['sandbox'] : false;

    conf['debug'] = options.containsKey('debug') ? options['debug'] : false;

    if (options.containsKey('client_id'))
      conf['clientId'] = options['client_id'];

    if (options.containsKey('client_secret'))
      conf['clientSecret'] = options['client_secret'];

    conf['timeout'] =
        options.containsKey('timeout') ? options['timeout'] : 30.0;

    if (isPix(options)) {
      conf['pixCert'] = options['pix_cert'];
      conf['pixPrivateKey'] = options['pix_private_key'];
    }

    if (options.containsKey('url'))
      conf['baseUri'] = options['url'];
    else {
      Map config = get('URL');

      config = isPix(options) ? config['PIX'] : config['DEFAULT'];

      conf['baseUri'] = config['production'];

      if (conf['sandbox']) conf['baseUri'] = config['sandbox'];
    }

    if (options.containsKey('headers')) conf['headers'] = options['headers'];

    if (options.containsKey('partner_token'))
      conf['partnerToken'] = options['partner_token'];

    return conf;
  }

  static isPix(Map options) {
    return options.containsKey('pix_cert') && options['pix_cert'] is String;
  }

  static get(String property) {
    dynamic options = CONSTANTS;
    if (options.containsKey(property)) {
      return options[property];
    }
    return;
  }
}
