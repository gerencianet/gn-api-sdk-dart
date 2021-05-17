import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await createSubscription(gn, 0);
  print(response);
}

dynamic createSubscription(Gerencianet gn, int planId) async {
  Map<String, dynamic> params = {'id': planId};
  dynamic body = {
    'items': [
      {'name': "Product 1", 'value': 1000, 'amount': 2}
    ]
  };
  return await gn.call('createSubscription', params: params, body: body);
}
