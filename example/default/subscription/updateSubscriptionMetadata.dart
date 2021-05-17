import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await updateSubscriptionMetadata(gn, 0);
  print(response);
}

dynamic updateSubscriptionMetadata(Gerencianet gn, int subscriptionId) async {
  Map<String, dynamic> params = {'id': subscriptionId};

  dynamic body = {
    'notification_url': 'http://yourdomain.com',
    'custom_id': 'my_new_id'
  };

  return await gn.call('updateSubscriptionMetadata',
      params: params, body: body);
}
