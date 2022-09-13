import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/gn/account/pixListSettings.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testGnDetailSettings(gn);
}

dynamic testGnDetailSettings(Gerencianet gn) async {
  test('pix account list settings', () async {
    _verifyPixListSettings(await pixListSettings(gn));
  });
}

dynamic _verifyPixListSettings(dynamic response) {
  expect(response.keys.toList(), equals(['pix']));
  expect(response['pix'].keys.toList(), equals(['receberSemChave', 'chaves']));
  return response;
}
