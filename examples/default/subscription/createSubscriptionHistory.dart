import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await createSubscriptionHistory(gn, 0);
  print(response);
}

dynamic createSubscriptionHistory(Gerencianet gn, int subscriptionId) async {
  Map<String, dynamic> params = {'id': subscriptionId};
  dynamic body = {'description': "This subscription was not fully paid"};
  return await gn.call('createSubscriptionHistory', params: params, body: body);
}
