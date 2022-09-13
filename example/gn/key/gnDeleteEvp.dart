import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await gnDeleteEvp(gn, "");
  print(response);
}

dynamic gnDeleteEvp(Gerencianet gn, String key) async {
  Map<String, dynamic> params = {
    "chave": key,
  };
  return await gn.call("gnDeleteEvp", params: params);
}
