import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/pix/pix/pixDetail.dart';
import '../../../example/pix/pix/pixListReceived.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixDetail(gn);
}

dynamic testPixDetail(Gerencianet gn) async {
  test('pix list detail', () async {
    dynamic pix = _verifyPixLocationList(await pixListReceived(gn));
    _verifyPixDetail(await pixDetail(gn, pix['pix'][0]['endToEndId']));
  });
}

dynamic _verifyPixLocationList(dynamic response) {
  expect(response.keys.toList(), equals(['parametros', 'pix']));
  return response;
}

dynamic _verifyPixDetail(dynamic response) {
  expect(response.keys.toList(),
      equals(['endToEndId', 'valor', 'chave', 'horario']));
  return response;
}
