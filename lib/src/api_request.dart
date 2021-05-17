
import 'auth.dart';
import 'exception/authorization_exception.dart';
import 'request.dart';

class ApiRequest {
  Request? _request;
  Auth? _auth;

  Map _options = {};

  ApiRequest(this._options) {
    this._request = new Request(_options);
    this._auth = new Auth(this._options);
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

      requestOptions['timeout'] = this._options.containsKey('timeout')
          ? double.parse(this._options['timeout'].toString())
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
