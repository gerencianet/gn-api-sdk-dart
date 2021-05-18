import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await createChargeHistory(gn, 0);
  print(response);
}

dynamic createChargeHistory(Gerencianet gn, int chargeId) async {
  dynamic body = {'description': "This charge was not fully paid"};
  Map<String, dynamic> params = {'id': chargeId};
  return await gn.call('createChargeHistory', params: params, body: body);
}
