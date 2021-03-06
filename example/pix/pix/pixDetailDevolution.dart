import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixDetailDevolution(gn, "", "");
  print(response);
}

dynamic pixDetailDevolution(Gerencianet gn, String e2eId, String id) async {
  Map<String, dynamic> params = {"e2eId": e2eId, "id": id};
  return await gn.call("pixDetailDevolution", params: params);
}
