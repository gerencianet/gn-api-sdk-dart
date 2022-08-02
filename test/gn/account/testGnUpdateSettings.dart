import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/gn/account/pixUpdateSettings.dart';
import '../../../example/gn/key/pixCreateEvp.dart';
import '../../../example/gn/key/pixDeleteEvp.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testGnUpdateSettings(gn);
}

dynamic testGnUpdateSettings(Gerencianet gn) async {
  test('pix account update settings', () async {
    dynamic key = _verifyPixCreateEvp(await pixCreateEvp(gn));
    _verifyPixUpdateSettings(await pixUpdateSettings(gn, key['chave']));
    _verifyDixDeleteEvp(await pixDeleteEvp(gn, key['chave']));
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
