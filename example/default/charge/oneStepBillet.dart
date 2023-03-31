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
      "banking_billet": {
        "expire_at": "2024-12-12",
        "customer": {
          "name": "Gorbadoc Oldbuck",
          "email": "oldbuck@gerencianet.com.br",
          "cpf": "94271564656",
          "phone_number": "5144916523"
        }
      }
    }
  };

  return await gn.call("oneStep", body: body);
}
