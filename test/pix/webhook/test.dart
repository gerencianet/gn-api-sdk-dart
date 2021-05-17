import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';
import 'testWebhookUrl.dart';
import 'testWebhookDelete.dart';
import 'testPixDetailWebhook.dart';
import 'testPixListWebhook.dart';

main() {
  CREDENTIALS_PIX['headers'] = {
    'x-skip-mtls-checking': 'true',
  };
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testsWebHook(gn, "");
}

void testsWebHook(Gerencianet gn, String url) {
  testWebhookUrl(gn, url);
  testWebhookDelete(gn, url);
  testPixDetailWebhook(gn);
  testPixListWebhook(gn);
}
