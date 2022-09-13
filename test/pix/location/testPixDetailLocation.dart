import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/pix/location/pixLocationGet.dart';
import '../../../example/pix/charge/pixCreateImmediateCharge.dart';
import '../../../example/gn/key/pixCreateEvp.dart';
import '../../../example/gn/key/pixDeleteEvp.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixDetailLocation(gn);
}

dynamic testPixDetailLocation(Gerencianet gn) async {
  test('pix location get', () async {
    dynamic key = _verifyPixCreateEvp(await pixCreateEvp(gn));
    dynamic charge = _verifyPixCreateImmediateCharge(
        await pixCreateImmediateCharge(gn, key['chave']));
    _verifyPixLocationGet(await pixLocationGet(gn, charge['loc']['id']));
    _verifyDixDeleteEvp(await pixDeleteEvp(gn, key['chave']));
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
