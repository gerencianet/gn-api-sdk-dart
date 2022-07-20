import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await paySubscription(gn, 915388);
  print(response);
}

dynamic paySubscription(Gerencianet gn, int subscriptionId) async {
  Map<String, dynamic> params = {'id': subscriptionId};
  dynamic body = {'email': "oldbuck@gerencianet.com.br"};
  return await gn.call('resendSubscriptionCharge', params: params, body: body);
}
