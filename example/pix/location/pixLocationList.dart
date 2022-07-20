import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixLocationList(gn);
  print(response);
}

dynamic pixLocationList(Gerencianet gn) async {
  Map<String, dynamic> params = {
    "inicio": "2022-01-01T16:01:35Z",
    "fim": "2022-12-31T16:01:35Z"
  };
  return await gn.call("pixLocationList", params: params);
}
