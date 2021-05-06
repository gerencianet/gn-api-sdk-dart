import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixUnsetTxid(gn, 0);
  print(response);
}

dynamic pixUnsetTxid(Gerencianet gn, int id) async {
  Map<String, dynamic> params = {"id": id};
  return await gn.call("pixUnsetTxid", params: params);
}
