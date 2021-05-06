import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';
import 'testCreatePlan.dart';
import 'testDeletePlan.dart';
import 'testGetPlans.dart';
import 'testUpdatePlan.dart';
import 'testCancelSubscription.dart';
import 'testCreateSubscription.dart';
import 'testCreateSubscriptionHistory.dart';
import 'testDetailSubscription.dart';
import 'testPaySubscription.dart';
import 'testUpdateSubscriptionMetadata.dart';

main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testsSubscription(gn, "");
}

void testsSubscription(Gerencianet gn, String paymentToken) {
  testGetPlans(gn);
  testCreatePlan(gn);
  testUpdatePlan(gn);
  testDeletePlan(gn);
  testCreateSubscription(gn);
  testDetailSubscription(gn);
  testCancelSubscription(gn);
  testUpdateSubscriptionMetadata(gn);
  testPaySubscription(gn, paymentToken);
  testCreateSubscriptionHistory(gn);
}
