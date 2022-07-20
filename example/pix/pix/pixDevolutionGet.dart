import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixDevolutionGet(gn, "", "");
  print(response);
}

dynamic pixDevolutionGet(Gerencianet gn, String e2eId, String id) async {
  Map<String, dynamic> params = {"e2eId": e2eId, "id": id};
  return await gn.call("pixDevolutionGet", params: params);
}
