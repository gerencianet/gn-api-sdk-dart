import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixLocationCreate(gn);
  print(response);
}

dynamic pixLocationCreate(Gerencianet gn) async {
  dynamic body = {"tipoCob": "cob"};
  return await gn.call("pixLocationCreate", body: body);
}
