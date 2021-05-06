import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/pix/charge/pixListCharges.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixListCharges(gn);
}

dynamic testPixListCharges(Gerencianet gn) async {
  test('pix charge list', () async {
    _verifyPixListCharges(await pixListCharges(gn));
  });
}

dynamic _verifyPixListCharges(dynamic response) {
  expect(
      response.keys.toList(),
      equals([
        'parametros',
        'cobs',
      ]));
  return response;
}
