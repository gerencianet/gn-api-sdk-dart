import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixCreateCharge(gn, "", "");
  print(response);
}

dynamic pixCreateCharge(Gerencianet gn, String txId, String key) async {
  Map<String, dynamic> params = {"txid": txId};

  dynamic body = {
    "calendario": {"expiracao": 3600},
    "devedor": {"cpf": "04267484171", "nome": "Gorbadoc Oldbuck"},
    "valor": {"original": "0.01"},
    "chave": key,
    "solicitacaoPagador": "Cobrança dos serviços prestados."
  };
  return await gn.call('pixCreateCharge', params: params, body: body);
}
