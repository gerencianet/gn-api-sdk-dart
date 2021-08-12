import 'dart:convert';

import 'config.dart';
import 'request.dart';

/// This class is used to create an authenticator Object, responsible to send
/// needed Gerencianet credentials (Client_Id and Client_Secret) to it's API.

class Auth {
  Map _config = {};
  Request? _request;
  String _clientId = "";
  String _clientSecret = "";
  String _accessToken = "";
  DateTime? _expires;
  String _pixCert = "";

  Auth(Map options) {
    this._config = Config.options(options);

    if (!this._config.containsKey('clientId') ||
        !this._config.containsKey('clientSecret'))
      throw new Exception('Client id or secret not found');

    this._request = new Request(options);

    this._clientId = this._config['clientId'];

    this._pixCert =
        this._config['pixCert'] != null ? this._config['pixCert'] : '';

    this._clientSecret = this._config['clientSecret'];
  }

  authorize() async {
    Map endpoints = Config.get('ENDPOINTS');

    dynamic requestOptions = {
      'headers': {
        'Authorization': "Basic " +
            base64
                .encode(utf8.encode(this._clientId + ":" + this._clientSecret))
                .toString()
      },
      'body': {'grant_type': 'client_credentials'},
      'timeout':
          this._config['timeout'] != null ? this._config['timeout'] : 30.0
    };

    if (!this._config.containsKey('headers')) this._config['headers'] = {};

    endpoints = this._pixCert != "" ? endpoints['PIX'] : endpoints['DEFAULT'];

    dynamic response = await this._request?.send(
        endpoints['authorize']['method'],
        endpoints['authorize']['route'],
        requestOptions);

    this._accessToken = response['access_token'];

    if (response['expire_at'] != null) {
      this._expires =
          DateTime.fromMillisecondsSinceEpoch(int.parse(response['expire_at']));
    }

    return;
  }

  DateTime? getExpires() {
    return this._expires;
  }

  String getAccessToken() {
    return this._accessToken;
  }
}
