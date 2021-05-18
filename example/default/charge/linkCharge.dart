import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await linkCharge(gn, 0);
  print(response);
}

dynamic linkCharge(Gerencianet gn, int chargeId) async {
  Map<String, dynamic> params = {'id': chargeId};
  dynamic body = {
    'billet_discount': 1,
    'card_discount': 1,
    'message': '',
    'expire_at': '2021-12-12',
    'request_delivery_address': false,
    'payment_method': 'all'
  };
  return await gn.call('linkCharge', params: params, body: body);
}
