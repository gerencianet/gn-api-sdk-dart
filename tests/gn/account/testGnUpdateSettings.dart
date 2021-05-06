import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/gn/account/gnUpdateSettings.dart';
import '../../../examples/gn/key/gnCreateEvp.dart';
import '../../../examples/gn/key/gnDeleteEvp.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testGnUpdateSettings(gn);
}

dynamic testGnUpdateSettings(Gerencianet gn) async {
  test('pix account update settings', () async {
    dynamic key = _verifyPixCreateEvp(await gnCreateEvp(gn));
    _verifyPixUpdateSettings(await gnUpdateSettings(gn, key['chave']));
    _verifyDixDeleteEvp(await gnDeleteEvp(gn, key['chave']));
  });
}

dynamic _verifyDixDeleteEvp(dynamic response) {
  expect(response, equals(null));
  return response;
}

dynamic _verifyPixCreateEvp(dynamic response) {
  expect(response.keys.toList(), equals(['chave']));
  return response;
}

dynamic _verifyPixUpdateSettings(dynamic response) {
  expect(response, equals(null));
  return response;
}
