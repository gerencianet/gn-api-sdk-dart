import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await updateCarnetMetadata(gn, 0);
  print(response);
}

dynamic updateCarnetMetadata(Gerencianet gn, int carnetId) async {
  Map<String, dynamic> params = {'id': carnetId};
  dynamic body = {
    'notification_url': 'http://yourdomain.com',
    'custom_id': 'my_new_id'
  };
  return await gn.call('updateCarnetMetadata', params: params, body: body);
}
