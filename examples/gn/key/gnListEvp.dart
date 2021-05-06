import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await gnListEvp(gn);
  print(response);
}

dynamic gnListEvp(Gerencianet gn) async {
  return await gn.call("gnListEvp");
}
