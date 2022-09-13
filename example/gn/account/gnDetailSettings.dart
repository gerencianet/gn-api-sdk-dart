import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await gnDetailSettings(gn);
  print(response);
}

dynamic gnDetailSettings(Gerencianet gn) async {
  return await gn.call("gnDetailSettings");
}
