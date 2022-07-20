import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await oneStepSubscriptionLink(gn, 1);
  print(response);
}

dynamic oneStepSubscriptionLink(Gerencianet gn, int planId) async {
  Map<String, dynamic> params = {'id': planId};
  dynamic body = {
    'items': [
      {'name': "Product One", 'value': 600, 'amount': 1}
    ],
    "settings": {
      'payment_method': 'all',
      'expire_at': '2022-12-15',
      'request_delivery_address': false
    }
  };
  return await gn.call('oneStepSubscriptionLink', params: params, body: body);
}
