import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';
import 'testcreateChargeBillet.dart';
import 'testCancelCharge.dart';
import 'testCreateCharge.dart';
import 'testCreateChargeBalanceSheet.dart';
import 'testCreateChargeHistory.dart';
import 'testLinkCharge.dart';
import 'testOneStepBillet.dart';
import 'testOneStepCard.dart';
import 'testPayChargeCard.dart';
import 'testDetailCharge.dart';
import 'testResendBillet.dart';
import 'testResendChargeLink.dart';
import 'testSettleCharge.dart';
import 'testUpdateBillet.dart';
import 'testUpdateChargeLink.dart';
import 'testUpdateChargeMetadata.dart';

main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testsCharge(gn, "", "");
}

void testsCharge(Gerencianet gn, String paymentToken1, String paymentToken2) {
  testCreateChargeBillet(gn);
  testCancelCharge(gn);
  testCreateCharge(gn);
  testCreateChargeBalanceSheet(gn);
  testCreateChargeHistory(gn);
  testLinkCharge(gn);
  testOneStepCard(gn, paymentToken1);
  testOneStepBillet(gn);
  testDetailCharge(gn);
  testResendBillet(gn);
  testResendChargeLink(gn);
  testSettleCharge(gn);
  testUpdateBillet(gn);
  testUpdateChargeLink(gn);
  testPayChargeCard(gn, paymentToken2);
  testUpdateChargeMetadata(gn);
}
