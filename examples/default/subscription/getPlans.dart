import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await getPlans(gn);
  print(response);
}

dynamic getPlans(Gerencianet gn) async {
  Map<String, dynamic> params = {'limit': 1, 'offset': 0};
  return await gn.call('getPlans', params: params);
}
