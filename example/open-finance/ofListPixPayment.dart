import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await ofListPixPayment(gn);
  print(response);
}

dynamic ofListPixPayment(Gerencianet gn) async {
  dynamic params = {"inicio": "2020-10-22", "fim": "2022-12-23"};
  return await gn.call('ofListPixPayment', params: params);
}
