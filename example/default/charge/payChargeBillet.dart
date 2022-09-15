import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await payCharge(gn, 0);
  print(response);
}

dynamic payCharge(Gerencianet gn, int chargeId) async {
  dynamic payment = {
    "payment": {
      "banking_billet": {
        "expire_at": "2022-12-12",
        "customer": {
          "name": "Gorbadoc Oldbucks",
          "email": "oldbuck@gerencianet.com.br",
          "cpf": "72992953008",
          "birth": "1977-01-15",
          "phone_number": "5144916523"
        }
      }
    }
  };

  return await gn.call("payCharge", params: {"id": chargeId}, body: payment);
}
