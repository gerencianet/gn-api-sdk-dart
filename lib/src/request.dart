import 'dart:convert';
import 'dart:io';
import 'config.dart';
import 'exception/authorization_exception.dart';

/// This class is responsible to create an HttpClient Object, generate the
/// request body and send it to a given endpoint. The send method return a
/// response for that request.

class Request {
  HttpClient _client = new HttpClient();
  Config _config = new Config();

  Request() {
    if (this._config.conf.containsKey('certificate')) {
      SecurityContext context = SecurityContext.defaultContext
        ..useCertificateChain(this._config.conf['certificate'], password: "")
        ..usePrivateKey(this._config.conf['privateKey'], password: "");
      this._client = new HttpClient(context: context);
    }
  }

  Future<dynamic> send(
      String method, String route, dynamic requestOptions) async {
    HttpClientRequest request = await this
        ._client
        .openUrl(method, Uri.parse(this._config.conf['baseUri'] + route));

    if (requestOptions.containsKey('headers'))
      requestOptions['headers']
          .keys
          .forEach((k) => request.headers.add(k, requestOptions['headers'][k]));

    if (this._config.conf.containsKey('headers'))
      this._config.conf['headers'].keys.forEach(
          (k) => request.headers.add(k, this._config.conf['headers'][k]));

    request.headers.add('Content-Type', 'application/json');
    request.headers.add('api-sdk', 'dart-${Config.version}');

    if (this._config.conf['partnerToken'] != null &&
        this._config.conf['partnerToken'] != '')
      request.headers.add('partner-token', this._config.conf['partnerToken']);

    String bodyEncode = json.encode(requestOptions['body']);

    request.contentLength = bodyEncode.length;

    request.write(bodyEncode);

    HttpClientResponse response = await request.close();

    if (response.statusCode == 401)
      return throw new AuthorizationException(response.statusCode.toString());

    String reply = await response.transform(utf8.decoder).join();

    if (reply != "") {
      Map responseDecode = json.decode(reply);

      if (response.statusCode > 299 || response.statusCode < 200) {
        if (responseDecode.containsKey('error_description'))
          throw new Exception("Erro ao realizar requisição. \n code: " +
              response.statusCode.toString() +
              " \n message: " +
              responseDecode['error_description'].toString());
        else
          throw new Exception("Erro ao realizar requisição. \n code: " +
              response.statusCode.toString() +
              " \n message: " +
              responseDecode['mensagem'].toString());
      }
      return responseDecode;
    }
  }
}
