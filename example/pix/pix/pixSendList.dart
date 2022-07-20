import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixSendList(gn);
  print(response);
}

dynamic pixSendList(Gerencianet gn) async {
  dynamic params = {"e2eId": 1};
  return await gn.call("pixSendList", params: params);
}
