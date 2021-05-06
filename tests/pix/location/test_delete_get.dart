import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/pix/location/pixDetailLocation.dart';
import '../../../examples/pix/charge/pixCreateImmediateCharge.dart';
import '../../../examples/gn/key/gnCreateEvp.dart';
import '../../../examples/gn/key/gnDeleteEvp.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixDetailLocation(gn);
}

dynamic testPixDetailLocation(Gerencianet gn) async {
  test('pix location get', () async {
    dynamic key = _verifyPixCreateEvp(await gnCreateEvp(gn));
    dynamic charge = _verifyPixCreateImmediateCharge(
        await pixCreateImmediateCharge(gn, key['chave']));
    _verifyPixLocationGet(await pixDetailLocation(gn, charge['loc']['id']));
    _verifyDixDeleteEvp(await gnDeleteEvp(gn, key['chave']));
  });
}

dynamic _verifyPixLocationGet(dynamic response) {
  expect(response.keys.toList(),
      equals(['id', 'location', 'tipoCob', 'criacao', 'txid']));
  return response;
}

dynamic _verifyDixDeleteEvp(dynamic response) {
  expect(response, equals(null));
  return response;
}

dynamic _verifyPixCreateEvp(dynamic response) {
  expect(response.keys.toList(), equals(['chave']));
  return response;
}

dynamic _verifyPixCreateImmediateCharge(dynamic response) {
  expect(
      response.keys.toList(),
      equals([
        'calendario',
        'txid',
        'revisao',
        'loc',
        'location',
        'status',
        'devedor',
        'valor',
        'chave',
        'solicitacaoPagador'
      ]));
  return response;
}
