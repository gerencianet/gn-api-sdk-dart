import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixUpdateCharge(gn, "");
  print(response);
}

dynamic pixUpdateCharge(Gerencianet gn, String txId) async {
  Map<String, dynamic> params = {"txid": txId};
  dynamic body = {
    'calendario': {'expiracao': 600},
    'chave': '',
    'infoAdicionais': [
      {'nome': 'Nome 01', 'valor': 'valor 01'}
    ]
  };
  return await gn.call("pixUpdateCharge", params: params, body: body);
}
