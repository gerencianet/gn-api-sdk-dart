import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/pix/location/pixUnsetTxid.dart';
import '../../../examples/pix/charge/pixCreateImmediateCharge.dart';
import '../../../examples/gn/key/gnCreateEvp.dart';
import '../../../examples/gn/key/gnDeleteEvp.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixUnsetTxid(gn);
}

dynamic testPixUnsetTxid(Gerencianet gn) async {
  test('pix location delete txid', () async {
    dynamic key = _verifyPixCreateEvp(await gnCreateEvp(gn));
    dynamic charge = _verifyPixCreateImmediateCharge(
        await pixCreateImmediateCharge(gn, key['chave']));
    _verifyPixLocationDelete(await pixUnsetTxid(gn, charge['loc']['id']));
    _verifyDixDeleteEvp(await gnDeleteEvp(gn, key['chave']));
  });
}

dynamic _verifyPixLocationDelete(dynamic response) {
  expect(
      response.keys.toList(), equals(['id', 'location', 'tipoCob', 'criacao']));
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
