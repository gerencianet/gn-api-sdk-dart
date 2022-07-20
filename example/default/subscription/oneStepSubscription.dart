import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await oneStepSubscription(gn, 0);
  print(response);
}

dynamic oneStepSubscription(Gerencianet gn, int planId) async {
  Map<String, dynamic> params = {'id': planId};
  dynamic body = {
    'items': [
      {'name': "Product 1", 'value': 1000, 'amount': 2}
    ],
    'payment': {
      'banking_billet': {
        'expire_at': '2022-12-12',
        'customer': {
          'name': "Gorbadoc Oldbuck",
          'email': "oldbuck@gerencianet.com.br",
          'cpf': "94271564656",
          'birth': "1977-01-15",
          'phone_number': "5144916523"
        }
      }
    }
  };
  return await gn.call('oneStepSubscription', params: params, body: body);
}
