import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await payListPayments(gn);
  print(response);
}

dynamic payListPayments(Gerencianet gn) async {
  dynamic params = {"dataInicio": "2020-10-22", "dataFim": "2022-12-31"};
  return await gn.call('payListPayments', params: params);
}
