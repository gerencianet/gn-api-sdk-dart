import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await deletePlan(gn, 0);
  print(response);
}

dynamic deletePlan(Gerencianet gn, int planId) async {
  Map<String, dynamic> params = {'id': planId};
  return await gn.call('deletePlan', params: params);
}
