import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await createCarnetHistory(gn, 0);
  print(response);
}

dynamic createCarnetHistory(Gerencianet gn, int carnetId) async {
  dynamic body = {'description': 'This carnet is about a service'};
  Map<String, dynamic> params = {'id': carnetId};
  return await gn.call('createCarnetHistory', params: params, body: body);
}
