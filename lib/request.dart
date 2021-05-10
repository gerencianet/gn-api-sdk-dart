import 'dart:convert';
import 'dart:io';

import 'package:gerencianet/config.dart';
import 'package:gerencianet/exception/authorization_exception.dart';

class Request {
  HttpClient _client = new HttpClient();
  Map _config = {};

  Request(Map options) {
    this._config = Config.options(options);

    if (this._config.containsKey('pixCert')) {
      SecurityContext context = SecurityContext.defaultContext
        ..useCertificateChain(this._config['pixCert'], password: "")
        ..usePrivateKey(this._config['pixPrivateKey'], password: "");

      this._client = new HttpClient(context: context);
    }
  }

  Future<dynamic> send(
      String method, String route, dynamic requestOptions) async {
    HttpClientRequest request = await this
        ._client
        .openUrl(method, Uri.parse(this._config['baseUri'] + route));

    if (requestOptions.containsKey('headers'))
      requestOptions['headers']
          .keys
          .forEach((k) => request.headers.add(k, requestOptions['headers'][k]));

    if (_config.containsKey('headers'))
      _config['headers']
          .keys
          .forEach((k) => request.headers.add(k, _config['headers'][k]));

    request.headers.add('Content-Type', 'application/json');
    request.headers.add('api-sdk', 'dart - ${Config.version}}');

    if (this._config['partnerToken'] != null &&
        this._config['partnerToken'] != '')
      request.headers.add('partner-token', this._config['partnerToken']);

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
