import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response =
      await pixUpdateDueCharge(gn, "NBCKcwJMXTIKj1DA2XZ48r3ltCasdqaadcc");
  print(response);
}

dynamic pixUpdateDueCharge(Gerencianet gn, String txId) async {
  Map<String, dynamic> params = {"txid": txId};

  dynamic body = {
    "devedor": {
      "logradouro": "Alameda Souza, Numero 80, Bairro Braz",
      "cidade": "Recife",
      "uf": "PE",
      "cep": "70011750",
      "cpf": "12345678909",
      "nome": "Francisco da Silva"
    },
    "valor": {"original": "123.45"},
    "solicitacaoPagador": "Cobrança dos serviços prestados."
  };
  return await gn.call('pixUpdateDueCharge', params: params, body: body);
}
