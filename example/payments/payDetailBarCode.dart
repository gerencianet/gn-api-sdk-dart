import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await payDetailBarCode(gn, "1");
  print(response);
}

dynamic payDetailBarCode(Gerencianet gn, String codBarras) async {
  dynamic params = {"codBarras": 1};
  return await gn.call('payDetailBarCode', params: params);
}
