import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'config.dart';
import 'exception/authorization_exception.dart';

/// This class is responsible to create an HttpClient Object, generate the
/// request body and send it to a given endpoint. The send method return a
/// response for that request.


class Request {
  HttpClient _client = new HttpClient();
  Map _config = {};

  Request(Map options) {
    this._config = Config.options(options);

    if (this._config.containsKey('pixCert')) _addCerts();
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
    request.headers.add('api-sdk', 'dart-${Config.version}');

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

  void _addCerts() async {
    SecurityContext context = SecurityContext.defaultContext;

    final List<int> certificateChainBytes =
        (await rootBundle.load(this._config['pixCert'])).buffer.asInt8List();
    context.useCertificateChainBytes(certificateChainBytes);
    final List<int> keyBytes =
        (await rootBundle.load(this._config['pixPrivateKey']))
            .buffer
            .asInt8List();
    context.usePrivateKeyBytes(keyBytes);
    this._client = new HttpClient(context: context);
  }
}
