import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/notifications/getNotification.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testGetNotifications(gn, "");
}

dynamic testGetNotifications(Gerencianet gn, String token) async {
  test('notifications get', () async {
    _verifyGetInstallments(await getNotification(gn, token));
  });
}

dynamic _verifyGetInstallments(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  return response;
}
