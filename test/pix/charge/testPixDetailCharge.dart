import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/pix/charge/pixCreateCharge.dart';
import '../../../example/pix/charge/pixDetailCharge.dart';
import '../../../example/gn/key/pixCreateEvp.dart';
import '../../../example/gn/key/pixDeleteEvp.dart';
import '../../credentials.dart';
import '../../utils/utils.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixDetailCharge(gn);
}

dynamic testPixDetailCharge(Gerencianet gn) async {
  test('pix charge detail', () async {
    String txid = generateTxId();
    dynamic key = _verifyPixCreateEvp(await pixCreateEvp(gn));
    _verifyPixCreateCharge(await pixCreateCharge(gn, txid, key['chave']));
    _verifyPixCreateCharge(await pixDetailCharge(gn, txid));
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
