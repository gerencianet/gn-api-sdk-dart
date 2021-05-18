import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await resendBillet(gn, 0);
  print(response);
}

dynamic resendBillet(Gerencianet gn, int chargeId) async {
  Map<String, dynamic> params = {'id': chargeId};
  dynamic body = {'email': 'oldbuck@gerencianet.com.br'};
  return await gn.call('resendBillet', params: params, body: body);
}
