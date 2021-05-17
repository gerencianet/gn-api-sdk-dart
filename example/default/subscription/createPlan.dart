import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await createPlan(gn);
  print(response);
}

dynamic createPlan(Gerencianet gn) async {
  dynamic body = {'name': "My first plan ", 'repeats': 12, 'interval': 2};
  return await gn.call('createPlan', body: body);
}
