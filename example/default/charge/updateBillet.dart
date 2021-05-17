import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await updateBillet(gn, 0);
  print(response);
}

dynamic updateBillet(Gerencianet gn, int chargeId) async {
  Map<String, dynamic> params = {'id': chargeId};
  dynamic body = {"expire_at": "2021-12-12"};
  return await gn.call('updateBillet', params: params, body: body);
}
