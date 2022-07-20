import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response =
      await pixGetWebhook(gn, "040fe73d-4b50-4a01-ae71-d70242b4cf58");
  print(response);
}

dynamic pixGetWebhook(Gerencianet gn, String key) async {
  Map<String, dynamic> params = {
    "chave": key,
  };
  return await gn.call("pixGetWebhook", params: params);
}
