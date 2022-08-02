import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/pix/charge/pixCreateCharge.dart';
import '../../../example/pix/charge/pixUpdateCharge.dart';
import '../../../example/gn/key/pixCreateEvp.dart';
import '../../../example/gn/key/pixDeleteEvp.dart';
import '../../credentials.dart';
import '../../utils/utils.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixUpdateCharge(gn);
}

dynamic testPixUpdateCharge(Gerencianet gn) async {
  test('pix charge update', () async {
    String txid = generateTxId();
    dynamic key = _verifyPixCreateEvp(await pixCreateEvp(gn));
    _verifyPixCreateCharge(await pixCreateCharge(gn, txid, key['chave']));
    _verifyPixUpdateCharge(await pixUpdateCharge(gn, txid));
    _verifyDixDeleteEvp(await pixDeleteEvp(gn, key['chave']));
  });
}

dynamic _verifyPixCreateEvp(dynamic response) {
  expect(response.keys.toList(), equals(['chave']));
  return response;
}

dynamic _verifyDixDeleteEvp(dynamic response) {
  expect(response, equals(null));
  return response;
}

dynamic _verifyPixUpdateCharge(dynamic response) {
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
        'solicitacaoPagador',
        'infoAdicionais'
      ]));
  return response;
}

dynamic _verifyPixCreateCharge(dynamic response) {
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
