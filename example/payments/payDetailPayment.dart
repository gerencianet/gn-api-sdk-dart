import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await payDetailPayment(gn, 1);
  print(response);
}

dynamic payDetailPayment(Gerencianet gn, int id) async {
  dynamic params = {"idPagamento": 1};
  return await gn.call('payDetailPayment', params: params);
}
