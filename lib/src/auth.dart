import 'dart:convert';
import 'config.dart';
import 'request.dart';

/// This class is used to create an authenticator Object, responsible to send
/// needed Gerencianet credentials (Client_Id and Client_Secret) to it's API.

class Auth {
  Config _config = new Config();
  Request? _request;
  String _clientId = "";
  String _clientSecret = "";
  String _accessToken = "";
  DateTime? _expires;
  String _pixCert = "";

  Auth() {
    if (!this._config.conf.containsKey('clientId') ||
        !this._config.conf.containsKey('clientSecret'))
      throw new Exception('Client id or secret not found');

    this._request = new Request();

    this._clientId = this._config.conf['clientId'];

    this._pixCert = this._config.conf['certificate'] != null
        ? this._config.conf['certificate']
        : '';

    this._clientSecret = this._config.conf['clientSecret'];
  }

  authorize() async {
    Map endpoints = {'route': '/authorize', 'method': 'post'};

    if (this._config.conf.containsKey('certificate'))
      endpoints = {'route': '/oauth/token', 'method': 'post'};

    dynamic requestOptions = {
      'headers': {
        'Authorization': "Basic " +
            base64
                .encode(utf8.encode(this._clientId + ":" + this._clientSecret))
                .toString()
      },
      'body': {'grant_type': 'client_credentials'},
      'timeout': this._config.conf['timeout']
    };

    if (!this._config.conf.containsKey('headers'))
      this._config.conf['headers'] = {};

    dynamic response = await this
        ._request
        ?.send(endpoints['method'], endpoints['route'], requestOptions);

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
