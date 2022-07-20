import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixCreateEvp(gn);
  print(response);
}

dynamic pixCreateEvp(Gerencianet gn) async {
  return await gn.call("pixCreateEvp");
}
