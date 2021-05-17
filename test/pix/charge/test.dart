import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';
import 'test_create.dart';
import 'testPixCreateImmediateCharge.dart';
import 'testPixDetailCharge.dart';
import 'testPixListCharges.dart';
import 'testPixUpdateCharge.dart';

main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testsCharge(gn);
}

void testsCharge(Gerencianet gn) {
  testPixCreateCharge(gn);
  testPixCreateImmediateCharge(gn);
  testPixDetailCharge(gn);
  testPixUpdateCharge(gn);
  testPixListCharges(gn);
}
