import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/gn/key/pixCreateEvp.dart';
import '../../../example/gn/key/pixDeleteEvp.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testGnDeleteEvp(gn);
}

dynamic testGnDeleteEvp(Gerencianet gn) async {
  test('pix key delete', () async {
    dynamic key = _verifyPixCreateEvp(await pixCreateEvp(gn));
    _verifyPixDeleteEvp(await pixDeleteEvp(gn, key['chave']));
  });
}

dynamic _verifyPixDeleteEvp(dynamic response) {
  expect(response, equals(null));
  return response;
}

dynamic _verifyPixCreateEvp(dynamic response) {
  expect(response.keys.toList(), equals(['chave']));
  return response;
}
