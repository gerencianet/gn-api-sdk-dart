import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixCreateLocation(gn);
  print(response);
}

dynamic pixCreateLocation(Gerencianet gn) async {
  dynamic body = {"tipoCob": "cob"};
  return await gn.call("pixCreateLocation", body: body);
}
