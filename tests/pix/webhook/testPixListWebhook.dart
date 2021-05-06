import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/pix/webhook/pixListWebhook.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixListWebhook(gn);
}

dynamic testPixListWebhook(Gerencianet gn) async {
  test('pix webhook list', () async {
    _verifyPixListWebhook(await pixListWebhook(gn));
  });
}

dynamic _verifyPixListWebhook(dynamic response) {
  expect(response.keys.toList(), equals(['parametros', 'webhooks']));
  return response;
}
