import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixDetailCharge(gn, "");
  print(response);
}

dynamic pixDetailCharge(Gerencianet gn, String txId) async {
  Map<String, dynamic> params = {"txid": txId};
  return await gn.call("pixDetailCharge", params: params);
}
