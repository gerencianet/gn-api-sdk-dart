import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await gnCreateEvp(gn);
  print(response);
}

dynamic gnCreateEvp(Gerencianet gn) async {
  return await gn.call("gnCreateEvp");
}
