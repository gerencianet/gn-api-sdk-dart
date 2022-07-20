import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixListBalance(gn);
  print(response);
}

dynamic pixListBalance(Gerencianet gn) async {
  return await gn.call('pixListBalance');
}
