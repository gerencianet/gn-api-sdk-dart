import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/pix/webhook/pixListWebhook.dart';
import '../../../example/pix/webhook/pixGetWebhook.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixDetailWebhook(gn);
}

dynamic testPixDetailWebhook(Gerencianet gn) async {
  test('pix webhook detail', () async {
    dynamic list = _verifyPixListWebhook(await pixListWebhook(gn))['webhooks'];
    for (final item in list) {
      String key = item['chave'];
      _verifyPixGetWebhook(await pixGetWebhook(gn, key));
      break;
    }
  });
}

dynamic _verifyPixGetWebhook(dynamic response) {
  expect(response.keys.toList(), equals(['webhookUrl', 'chave', 'criacao']));
  return response;
}

dynamic _verifyPixListWebhook(dynamic response) {
  expect(response.keys.toList(), equals(['parametros', 'webhooks']));
  return response;
}
