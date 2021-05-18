import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await gnUpdateSettings(gn, "");
  print(response);
}

dynamic gnUpdateSettings(Gerencianet gn, String key) async {
  dynamic body = {
    'pix': {
      'receberSemChave': true,
      'chaves': {
        key: {
          'recebimento': {
            'txidObrigatorio': true,
            'qrCodeEstatico': {'recusarTodos': true}
          }
        }
      }
    }
  };
  return await gn.call('gnUpdateSettings', body: body);
}
