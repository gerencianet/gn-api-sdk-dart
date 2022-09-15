import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixUpdateSettings(gn, "");
  print(response);
}

dynamic pixUpdateSettings(Gerencianet gn, String key) async {
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
  return await gn.call('pixUpdateSettings', body: body);
}
