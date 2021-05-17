import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await getInstallments(gn);
  print(response);
}

dynamic getInstallments(Gerencianet gn) async {
  Map<String, dynamic> params = {'brand': 'visa', 'total': 5000};
  return await gn.call('getInstallments', params: params);
}
