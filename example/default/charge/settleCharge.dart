import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await settleCharge(gn, 0);
  print(response);
}

dynamic settleCharge(Gerencianet gn, int chargeId) async {
  Map<String, dynamic> params = {'id': chargeId};
  return await gn.call('settleCharge', params: params);
}
