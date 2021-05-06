import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';
import 'testGetNotifications.dart';

main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testsNotifications(gn, "");
}

void testsNotifications(Gerencianet gn, String tokenNotifications) {
  testGetNotifications(gn, tokenNotifications);
}
