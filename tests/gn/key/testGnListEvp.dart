import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/gn/key/gnListEvp.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testGnListEvp(gn);
}

dynamic testGnListEvp(Gerencianet gn) async {
  test('pix key list', () async {
    _verifyPixListEvp(await gnListEvp(gn));
  });
}

dynamic _verifyPixListEvp(dynamic response) {
  expect(response.keys.toList(), equals(['chaves']));
  return response;
}
