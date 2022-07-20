import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixCreateDueCharge(gn, "", "");
  print(response);
}

dynamic pixCreateDueCharge(Gerencianet gn, String txId, String key) async {
  Map<String, dynamic> params = {"txid": txId};

  dynamic body = {
    "calendario": {
      "dataDeVencimento": "2022-12-01",
      "validadeAposVencimento": 30
    },
    "devedor": {
      "logradouro": "Alameda Souza, Numero 80, Bairro Braz",
      "cidade": "Recife",
      "uf": "PE",
      "cep": "70011750",
      "cpf": "12345678909",
      "nome": "Francisco da Silva"
    },
    "valor": {
      "original": "123.45",
      "multa": {"modalidade": 2, "valorPerc": "15.00"},
      "juros": {"modalidade": 2, "valorPerc": "2.00"},
      "desconto": {
        "modalidade": 1,
        "descontoDataFixa": [
          {"data": "2022-11-30", "valorPerc": "30.00"}
        ]
      }
    },
    "chave": key,
    "solicitacaoPagador": "Cobrança dos serviços prestados."
  };
  return await gn.call('pixCreateDueCharge', params: params, body: body);
}
