import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await detailSubscription(gn, 0);
  print(response);
}

dynamic detailSubscription(Gerencianet gn, int subscriptionId) async {
  Map<String, dynamic> params = {'id': subscriptionId};
  return await gn.call('detailSubscription', params: params);
}
