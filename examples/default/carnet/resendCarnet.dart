import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await resendCarnet(gn, 0);
  print(response);
}

dynamic resendCarnet(Gerencianet gn, int carnetId) async {
  dynamic body = {'email': 'oldbuck@gerencianet.com.br'};
  Map<String, dynamic> params = {'id': carnetId};
  return await gn.call('resendCarnet', params: params, body: body);
}
