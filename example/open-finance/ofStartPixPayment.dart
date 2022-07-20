import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';

void main() async {
  credentials['headers'] = {
    'x-idempotency-key': 'et sedaute sint officiapariatur amet tute sum',
  };
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await ofStartPixPayment(gn);
  print(response);
}

dynamic ofStartPixPayment(Gerencianet gn) async {
  dynamic body = {
    "pagador": {
      "idParticipante": "75db457a-612d-4d62-b557-ba9d32b05216",
      "cpf": "12345678909",
    },
    "favorecido": {
      "contaBanco": {
        "codigoBanco": "364",
        "agencia": "0001",
        "documento": "01234567890",
        "nome": "Gerencianet Pagamentos",
        "conta": "200045",
        "tipoConta": "CACC"
      }
    },
    "valor": "0.01",
    "infoPagador": "Compra dia xx"
  };
  return await gn.call('ofStartPixPayment', body: body);
}
