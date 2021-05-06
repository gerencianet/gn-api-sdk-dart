import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixDetailWebhook(gn, "");
  print(response);
}

dynamic pixDetailWebhook(Gerencianet gn, String key) async {
  Map<String, dynamic> params = {
    "chave": key,
  };
  return await gn.call("pixDetailWebhook", params: params);
}
