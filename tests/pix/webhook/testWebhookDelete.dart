import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/pix/webhook/webhookUrl.dart';
import '../../../examples/pix/webhook/pixDeleteWebhook.dart';
import '../../../examples/gn/key/gnCreateEvp.dart';
import '../../../examples/gn/key/gnDeleteEvp.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testWebhookDelete(gn, "");
}

dynamic testWebhookDelete(Gerencianet gn, String url) async {
  test('pix webhook delete', () async {
    dynamic key = _verifyPixCreateEvp(await gnCreateEvp(gn));
    _verifyPixWebhookCreate(await pixConfigWebhook(gn, key['chave'], url));
    await Future.delayed(const Duration(seconds: 1), () async {
      _verifyPixWebhookDelete(await pixDeleteWebhook(gn, key['chave']));
      _verifyPixDeleteEvp(await gnDeleteEvp(gn, key['chave']));
    });
  });
}

dynamic _verifyPixWebhookDelete(dynamic response) {
  expect(response, null);
  return response;
}

dynamic _verifyPixWebhookCreate(dynamic response) {
  expect(response.keys.toList(), equals(['webhookUrl']));
  return response;
}

dynamic _verifyPixCreateEvp(dynamic response) {
  expect(response.keys.toList(), equals(['chave']));
  return response;
}

dynamic _verifyPixDeleteEvp(dynamic response) {
  expect(response, equals(null));
  return response;
}
