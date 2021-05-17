import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixListWebhook(gn);
  print(response);
}

dynamic pixListWebhook(Gerencianet gn) async {
  Map<String, dynamic> params = {
    "inicio": "2021-01-31T16:01:35Z",
    "fim": "2021-12-31T16:01:35Z"
  };
  return await gn.call("pixListWebhook", params: params);
}
