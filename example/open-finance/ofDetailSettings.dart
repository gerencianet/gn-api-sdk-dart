import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await ofDetailSettings(gn);
  print(response);
}

dynamic ofDetailSettings(Gerencianet gn) async {
  return await gn.call('ofDetailSettings');
}
