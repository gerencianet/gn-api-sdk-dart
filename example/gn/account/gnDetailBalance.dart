import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await gnDetailBalance(gn);
  print(response);
}

dynamic gnDetailBalance(Gerencianet gn) async {
  return await gn.call('gnDetailBalance');
}
