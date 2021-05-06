import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await createCharge(gn);
  print(response);
}

dynamic createCharge(Gerencianet gn) async {
  dynamic body = {
    'items': [
      {'name': "Product 1", 'value': 1100, 'amount': 2}
    ],
  };

  return await gn.call('createCharge', body: body);
}
