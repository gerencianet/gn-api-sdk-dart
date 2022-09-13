import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixDetailLocation(gn, 0);
  print(response);
}

dynamic pixDetailLocation(Gerencianet gn, int id) async {
  Map<String, dynamic> params = {"id": id};
  return await gn.call("pixDetailLocation", params: params);
}
