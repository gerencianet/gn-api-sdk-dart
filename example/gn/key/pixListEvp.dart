import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixListEvp(gn);
  print(response);
}

dynamic pixListEvp(Gerencianet gn) async {
  return await gn.call("pixListEvp");
}
