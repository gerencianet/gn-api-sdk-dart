import 'config.dart';
import 'auth.dart';
import 'exception/authorization_exception.dart';
import 'request.dart';

/// This class instance a Auth Object, to authenticate client credentials in
/// Gerencianet API. After client's credentials are validated a client Object
/// send a given request body to a given endpoint throw a given route.

class ApiRequest {
  Request? _request;
  Auth? _auth;
  Config _config = new Config();

  ApiRequest() {
    this._request = new Request();
    this._auth = new Auth();
  }

  Future<dynamic> send(
    String method,
    String route,
    Map<String, dynamic> requestOptions,
  ) async {
    try {
      DateTime? expireDate = this._auth?.getExpires();

      if (expireDate == null || expireDate.compareTo(new DateTime.now()) <= 0)
        await this._auth?.authorize();

      requestOptions['headers'] = {
        'Authorization': 'Bearer ${this._auth?.getAccessToken()}'
      };

      requestOptions['timeout'] = this._config.conf.containsKey('timeout')
          ? double.parse(this._config.conf['timeout'].toString())
          : 30.0;

      dynamic response =
          await this._request?.send(method, route, requestOptions);

      return response;
    } on AuthorizationException {
      await this._auth?.authorize();
      requestOptions['headers'] = {
        'Authorization': 'Bearer ${this._auth?.getAccessToken()}'
      };
      return this._request?.send(method, route, requestOptions);
    }
  }
}
