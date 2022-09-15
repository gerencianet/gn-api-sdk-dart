import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixDetailDueCharge(gn, "");
  print(response);
}

dynamic pixDetailDueCharge(Gerencianet gn, String txId) async {
  Map<String, dynamic> params = {"txid": txId};
  return await gn.call('pixDetailDueCharge', params: params);
}
