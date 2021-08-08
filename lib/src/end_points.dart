import 'payment_token.dart';
import 'api_request.dart';
import 'config.dart';

class EndPoints {
  ApiRequest? _requester;
  Map _endPoints = {};
  dynamic config = {};

  EndPoints(Map options) {
    this._requester = new ApiRequest(options);

    this._endPoints = Config.get('ENDPOINTS');

    this._endPoints = Config.isPix(options)
        ? this._endPoints['PIX']
        : this._endPoints['DEFAULT'];

    this.config = Config.options(options);
  }

  Future<dynamic> call(String endpoint,
      {Map<String, dynamic>? params,
      dynamic body,
      Map<String, String>? headers}) async {
    return endpoint != "paymentToken"
        ? await _kernelCall(endpoint, params: params, body: body)
        : PaymentToken.generate(body, this.config);
  }

  Future<dynamic> _kernelCall(String endpointName,
      {Map<String, dynamic>? params, dynamic body}) async {
    if (this._endPoints[endpointName] == null)
      throw new Exception("nonexistent endpoint");

    dynamic endpoint = this._endPoints[endpointName];

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
