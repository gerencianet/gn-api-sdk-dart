import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/pix/location/pixGenerateQRCode.dart';
import '../../../example/pix/location/pixLocationCreate.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixGenerateQRCode(gn);
}

dynamic testPixGenerateQRCode(Gerencianet gn) async {
  test('pix location qrcode', () async {
    dynamic loc = _verifyPixLocationCreate(await pixLocationCreate(gn));
    _verifyPixGenerateQRCode(await pixGenerateQRCode(gn, loc['id']));
  });
}

dynamic _verifyPixGenerateQRCode(dynamic response) {
  expect(response.keys.toList(), equals(['qrcode', 'imagemQrcode']));
  return response;
}

dynamic _verifyPixLocationCreate(dynamic response) {
  expect(
      response.keys.toList(), equals(['id', 'location', 'tipoCob', 'criacao']));
  return response;
}
