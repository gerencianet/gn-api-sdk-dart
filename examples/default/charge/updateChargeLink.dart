import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await updateChargeLink(gn, 0);
  print(response);
}

dynamic updateChargeLink(Gerencianet gn, int chargeId) async {
  dynamic body = {"expire_at": "2021-12-12"};
  Map<String, dynamic> params = {"id": chargeId};
  return await gn.call("updateChargeLink", params: params, body: body);
}
