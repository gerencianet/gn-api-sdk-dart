import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await ofUpdateSettings(gn);
  print(response);
}

dynamic ofUpdateSettings(Gerencianet gn) async {
  dynamic body = {
    "redirectURL": "https://gerencianet.com.br",
    "webhookURL": "https://gerencianetwh.tk/webhook"
  };
  return await gn.call('ofUpdateSettings', body: body);
}
