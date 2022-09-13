import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/pix/charge/pixCreateImmediateCharge.dart';
import '../../../example/gn/key/gnCreateEvp.dart';
import '../../../example/gn/key/gnDeleteEvp.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixCreateImmediateCharge(gn);
}

dynamic testPixCreateImmediateCharge(Gerencianet gn) async {
  test('pix charge create immediate', () async {
    dynamic key = _verifyPixCreateEvp(await gnCreateEvp(gn));
    _verifyPixCreateImmediateCharge(
        await pixCreateImmediateCharge(gn, key['chave']));
    _verifyDixDeleteEvp(await gnDeleteEvp(gn, key['chave']));
  });
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
