import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await createCarnet(gn);
  print(response);
}

dynamic createCarnet(Gerencianet gn) async {
  dynamic body = {
    "expire_at": "2021-12-12",
    "items": [
      {"name": "Carnet Item 1", "value": 1000, "amount": 2}
    ],
    "customer": {
      "name": "Gorbadoc Oldbuck",
      "email": "oldbuck@gerencianet.com.br",
      "cpf": "62959186036",
      "birth": "1977-01-15",
      "phone_number": "5144916523"
    },
    "repeats": 12,
    "split_items": false
  };

  return await gn.call("createCarnet", body: body);
}
