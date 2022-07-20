import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixListSettings(gn);
  print(response);
}

dynamic pixListSettings(Gerencianet gn) async {
  return await gn.call("pixListSettings");
}
