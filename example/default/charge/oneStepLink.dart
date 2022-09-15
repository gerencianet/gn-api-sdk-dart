import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await createCharge(gn);
  print(response);
}

dynamic createCharge(Gerencianet gn) async {
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

  return await gn.call("oneStepLink", body: body);
}
