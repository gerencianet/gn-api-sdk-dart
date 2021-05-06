import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/pix/pix/pixListReceived.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixListReceived(gn);
}

dynamic testPixListReceived(Gerencianet gn) async {
  test('pix list received', () async {
    _verifyPixLocationList(await pixListReceived(gn));
  });
}

dynamic _verifyPixLocationList(dynamic response) {
  expect(response.keys.toList(), equals(['parametros', 'pix']));
  return response;
}
