import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await payCharge(gn, 0, "");
  print(response);
}

dynamic payCharge(Gerencianet gn, int chargeId, String paymentToken) async {
  Map<String, dynamic> params = {"id": chargeId};
  dynamic payment = {
    "payment": {
      "credit_card": {
        "installments": 1,
        "payment_token": paymentToken,
        "billing_address": {
          "street": "Av. JK",
          "number": 909,
          "neighborhood": "Bauxita",
          "zipcode": "35400000",
          "city": "Ouro Preto",
          "state": "MG"
        },
        "customer": {
          "name": "Gorbadoc Oldbuck",
          "email": "oldbuck@gerencianet.com.br",
          "cpf": "04267484171",
          "birth": "1977-01-15",
          "phone_number": "5144916523"
        }
      }
    }
  };
  return await gn.call("payCharge", params: params, body: payment);
}
