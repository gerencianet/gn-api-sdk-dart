import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await cancelSubscription(gn, 0);
  print(response);
}

dynamic cancelSubscription(Gerencianet gn, int subscriptionId) async {
  Map<String, dynamic> params = {'id': subscriptionId};
  return await gn.call('cancelSubscription', params: params);
}
