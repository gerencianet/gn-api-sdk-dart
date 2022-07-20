import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await createReport(gn, "", "");
  print(response);
}

dynamic createReport(Gerencianet gn, String txId, String key) async {
  Map<String, dynamic> params = {"txid": txId};

  dynamic body = {
    "dataMovimento": "2022-04-24",
    "tipoRegistros": {
      "pixRecebido": true,
      "pixDevolucaoEnviada": false,
      "tarifaPixRecebido": true,
      "pixEnviadoChave": true,
      "pixEnviadoDadosBancarios": false,
      "pixDevolucaoRecebida": true
    }
  };
  return await gn.call('createReport', params: params, body: body);
}
