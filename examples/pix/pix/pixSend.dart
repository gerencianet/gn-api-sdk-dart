import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixSend(gn);
  print(response);
}

dynamic pixSend(Gerencianet gn) async {
  dynamic body = {
    'valor': '',
    'pagador': {'chave': ''},
    'favorecido': {'chave': ''}
  };
  return await gn.call("pixSend", body: body);
}
