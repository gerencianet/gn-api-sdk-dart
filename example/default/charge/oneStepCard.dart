import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await createChargeOneStep(gn);
  print(response);
}

dynamic createChargeOneStep(Gerencianet gn) async {
  dynamic body = {
  "items": [
    {"name": "Product 1", "value": 1000, "amount": 2}
  ],
  "shippings": [
    {"name": "Default Shipping Cost", "value": 100}
  ],
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
        "cpf": "94271564656",
        "birth": "1977-01-15",
        "phone_number": "5144916523"
      }
    }
  }
};

  return await gn.call("oneStep", body: body);
}
