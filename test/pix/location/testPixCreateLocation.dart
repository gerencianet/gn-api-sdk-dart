import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/pix/location/pixCreateLocation.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixCreateLocation(gn);
}

dynamic testPixCreateLocation(Gerencianet gn) async {
  test('pix location create', () async {
    _verifyPixLocationCreate(await pixCreateLocation(gn));
  });
}

dynamic _verifyPixLocationCreate(dynamic response) {
  expect(
      response.keys.toList(), equals(['id', 'location', 'tipoCob', 'criacao']));
  return response;
}
