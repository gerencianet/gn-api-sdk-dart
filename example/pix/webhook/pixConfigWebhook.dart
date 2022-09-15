import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  credentials['headers'] = {
    'x-skip-mtls-checking': 'true',
  };
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixConfigWebhook(
      gn,
      "040fe73d-4b50-4a01-ae71-d70242b4cf58",
      "https://pix.igorpedroso.dev/prod/webhook");
  print(response);
}

dynamic pixConfigWebhook(Gerencianet gn, String key, String url) async {
  Map<String, dynamic> params = {
    "chave": key,
  };
  dynamic body = {"webhookUrl": url};
  return await gn.call("pixConfigWebhook", params: params, body: body);
}
