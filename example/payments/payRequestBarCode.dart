import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await payRequestBarCode(gn);
  print(response);
}

dynamic payRequestBarCode(Gerencianet gn) async {
  dynamic params = {"codBarras": 1};

  dynamic body = {
    "valor": 9300,
    "dataPagamento": "2022-06-17",
    "descricao": "Pagamento de boleto, teste API Pagamentos"
  };

  return await gn.call('payRequestBarCode', params: params, body: body);
}
