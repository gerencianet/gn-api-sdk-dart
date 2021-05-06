import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await updatePlan(gn, 0);
  print(response);
}

dynamic updatePlan(Gerencianet gn, int planId) async {
  Map<String, dynamic> params = {'id': planId};
  dynamic body = {'name': 'Update name Plan'};
  return await gn.call('updatePlan', params: params, body: body);
}
