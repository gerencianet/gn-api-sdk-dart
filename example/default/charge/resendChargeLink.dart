import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await resendChargeLink(gn, 0);
  print(response);
}

dynamic resendChargeLink(Gerencianet gn, int chargeId) async {
  Map<String, dynamic> params = {'id': chargeId};
  dynamic payment = {"email": "oldbuck@gerencianet.com.br"};
  return await gn.call("resendChargeLink", params: params, body: payment);
}
