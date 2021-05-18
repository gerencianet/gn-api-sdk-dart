import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await getNotification(gn, "");
  print(response);
}

dynamic getNotification(Gerencianet gn, String token) async {
  Map<String, dynamic> params = {'token': token};
  return await gn.call('getNotification', params: params);
}
