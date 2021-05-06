import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixDevolution(gn, "", "");
  print(response);
}

dynamic pixDevolution(Gerencianet gn, String e2eId, String id) async {
  dynamic body = {"valor": "0.01"};
  Map<String, dynamic> params = {"e2eId": e2eId, 'id': id};
  return await gn.call("pixDevolution", body: body, params: params);
}
