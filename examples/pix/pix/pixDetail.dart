import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixDetail(gn, "");
  print(response);
}

dynamic pixDetail(Gerencianet gn, String e2eId) async {
  Map<String, dynamic> params = {"e2eId": e2eId};
  return await gn.call("pixDetail", params: params);
}
