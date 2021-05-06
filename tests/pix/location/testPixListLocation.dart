import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/pix/location/pixListLocation.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixListLocation(gn);
}

dynamic testPixListLocation(Gerencianet gn) async {
  test('pix location list', () async {
    _verifyPixLocationList(await pixListLocation(gn));
  });
}

dynamic _verifyPixLocationList(dynamic response) {
  expect(response.keys.toList(), equals(['parametros', 'loc']));
  return response;
}
