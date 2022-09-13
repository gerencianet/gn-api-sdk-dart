import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/gn/key/gnCreateEvp.dart';
import '../../../example/gn/key/gnDeleteEvp.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testGnDeleteEvp(gn);
}

dynamic testGnDeleteEvp(Gerencianet gn) async {
  test('pix key delete', () async {
    dynamic key = _verifyPixCreateEvp(await gnCreateEvp(gn));
    _verifyPixDeleteEvp(await gnDeleteEvp(gn, key['chave']));
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
