import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await detailCharge(gn, 0);
  print(response);
}

dynamic detailCharge(Gerencianet gn, int chargeId) async {
  Map<String, dynamic> params = {'id': chargeId};
  return await gn.call('detailCharge', params: params);
}
