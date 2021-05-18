import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await cancelCharge(gn, 0);
  print(response);
}

dynamic cancelCharge(Gerencianet gn, int id) async {
  return await gn.call("cancelCharge", params: {"id": id});
}
