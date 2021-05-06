import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await detailCarnet(gn, 0);
  print(response);
}

dynamic detailCarnet(Gerencianet gn, int carnetId) async {
  Map<String, dynamic> params = {'id': carnetId};
  return await gn.call('detailCarnet', params: params);
}
