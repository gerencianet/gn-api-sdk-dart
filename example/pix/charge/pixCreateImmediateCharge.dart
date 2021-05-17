import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixCreateImmediateCharge(gn, "");
  print(response);
}

dynamic pixCreateImmediateCharge(Gerencianet gn, String key) async {
  dynamic body = {
    "calendario": {"expiracao": 3600},
    "devedor": {"cpf": "04267484171", "nome": "Gorbadoc Oldbuck"},
    "valor": {"original": "0.01"},
    "chave": key,
    'solicitacaoPagador': "Cobrança dos serviços prestados."
  };
  return await gn.call("pixCreateImmediateCharge", body: body);
}
