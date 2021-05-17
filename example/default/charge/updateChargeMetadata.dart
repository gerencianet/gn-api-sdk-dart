import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await updateChargeMetadata(gn, 0);
  print(response);
}

dynamic updateChargeMetadata(Gerencianet gn, int chargeId) async {
  Map<String, dynamic> params = {'id': chargeId};

  dynamic body = {
    'notification_url': 'http://yourdomain.com',
    'custom_id': 'my_new_id'
  };

  return await gn.call('updateChargeMetadata', params: params, body: body);
}
