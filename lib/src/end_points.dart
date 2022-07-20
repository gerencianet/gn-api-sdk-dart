import 'package:gerencianet/src/payment_token.dart';
import 'api_request.dart';
import 'config.dart';

/// This is the mains class of Gerencianet SDK. It's responsible to instance an ApiRequest,
/// send the right data to a given endpoint, and return a response to SDK client.

class EndPoints {
  ApiRequest? _requester;
  Config _config = new Config();

  EndPoints(Map options) {
    this._config.set(options);
    this._requester = new ApiRequest();
  }

  Future<dynamic> call(String endpoint,
      {Map<String, dynamic>? params,
      dynamic body,
      Map<String, String>? headers}) async {
    return await _kernelCall(endpoint, params: params, body: body);
  }

  Future<dynamic> _kernelCall(String endpointName,
      {Map<String, dynamic>? params, dynamic body}) async {
    dynamic endpoint = this._config.getEndpoint(endpointName);

    if (endpointName == 'paymentToken')
      return PaymentToken.generate(body, this._config.conf);

    String route = _getRoute(endpoint, params);

    if (params != null) {
      String query = _getQueryString(params);
      route = route + query;
    }

    Map<String, dynamic> requestOptions = {
      'body': body != null ? body : {},
    };
    return await this
        ._requester
        ?.send(endpoint['method'], route, requestOptions);
  }

  String _getRoute(endpoint, params) {
    RegExp pattern = RegExp("/:(\\w+)/");

    String route = endpoint["route"].toString();

    route += "/";

    Iterable<RegExpMatch> matcher = pattern.allMatches(route);

    String newRoute = route;

    for (var element in matcher) {
      String value = route.substring(element.start + 2, element.end - 1);
      if (params.containsKey(value)) {
        newRoute = newRoute.replaceAll(":" + value, params[value].toString());
        params.remove(value);
      }
    }

    return newRoute;
  }

  String _getQueryString(Map<String, dynamic> params) {
    List<String> keys = params.keys.toList();

    if (keys.length == 0) return '';

    String query = "?";

    params.forEach((key, value) {
      query = query + "$key=$value&";
    });

    return query.substring(0, query.length - 1);
  }
}
