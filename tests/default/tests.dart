import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';
import './carnet/test.dart';
import './charge/test.dart';
import 'notifications/testGetNotifications.dart';
import './others/test.dart';
import './subscription/test.dart';

void main() {
  String paymentToken1 = "";
  String paymentToken2 = "";
  String paymentToken3 = "";
  String notificationToken = "";
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testsDefault(
      gn, paymentToken1, paymentToken2, paymentToken3, notificationToken);
}

void testsDefault(
  Gerencianet gn,
  String paymentToken1,
  String paymentToken2,
  String paymentToken3,
  String notificationToken,
) {
  testsCharge(gn, paymentToken1, paymentToken2);
  testGetNotifications(gn, notificationToken);
  testsOthers(gn);
  testsSubscription(gn, paymentToken3);
  testsCarnet(gn);
}
