import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  Map<String, Object> card = {
    "brand": "",
    "number": "",
    "cvv": "",
    "expiration_month": "",
    "expiration_year": ""
  };
  dynamic response = await payCharge(gn, 0, card);
  print(response);
}

dynamic payCharge(
    Gerencianet gn, int chargeId, Map<String, Object> card) async {
  dynamic paymentToken = await gn.call("paymentToken", body: card);

  Map<String, dynamic> params = {"id": chargeId};
  dynamic payment = {
    "payment": {
      "credit_card": {
        "installments": 1,
        "payment_token": paymentToken['data']['payment_token'],
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
