import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixDeleteWebhook(gn, "");
  print(response);
}

dynamic pixDeleteWebhook(Gerencianet gn, String key) async {
  Map<String, dynamic> params = {"chave": key};
  return await gn.call("pixDeleteWebhook", params: params);
}
