import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixDeleteEvp(gn, "");
  print(response);
}

dynamic pixDeleteEvp(Gerencianet gn, String key) async {
  Map<String, dynamic> params = {
    "chave": key,
  };
  return await gn.call("pixDeleteEvp", params: params);
}
