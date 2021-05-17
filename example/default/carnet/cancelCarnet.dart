import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await cancelCarnet(gn, 0);
  print(response);
}

dynamic cancelCarnet(Gerencianet gn, int carnetId) async {
  Map<String, dynamic> params = {'id': carnetId};
  return await gn.call('cancelCarnet', params: params);
}
