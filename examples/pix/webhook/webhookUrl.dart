import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  credentials['headers'] = {
    'x-skip-mtls-checking': 'true',
  };
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixConfigWebhook(gn, "", "");
  print(response);
}

dynamic pixConfigWebhook(Gerencianet gn, String key, String url) async {
  Map<String, dynamic> params = {
    "chave": key,
  };
  dynamic body = {"webhookUrl": url};
  return await gn.call("pixConfigWebhook", params: params, body: body);
}
