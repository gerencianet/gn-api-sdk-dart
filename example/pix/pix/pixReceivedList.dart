import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixReceivedList(gn);
  print(response);
}

dynamic pixReceivedList(Gerencianet gn) async {
  Map<String, dynamic> params = {
    "inicio": "2022-01-01T16:01:35Z",
    "fim": "2022-12-31T16:01:35Z"
  };
  return await gn.call("pixReceivedList", params: params);
}
