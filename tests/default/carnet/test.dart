import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';
import 'testCancelCarnet.dart';
import 'testCancelParcel.dart';
import 'testCreateCarnet.dart';
import 'testCreateCarnetHistory.dart';
import 'testDetailCarnet.dart';
import 'testResendCarnet.dart';
import 'testResendParcel.dart';
import 'testSettleCarnet.dart';
import 'testSettleCarnetParcel.dart';
import 'testUpdateCarnetMetadata.dart';
import 'testUpdateParcel.dart';

main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testsCarnet(gn);
}

void testsCarnet(Gerencianet gn) {
  testCreateCarnet(gn);
  testDetailCarnet(gn);
  testUpdateCarnetMetadata(gn);
  testUpdateParcel(gn);
  testCancelCarnet(gn);
  testCancelParcel(gn);
  testResendCarnet(gn);
  testResendParcel(gn);
  testCreateCarnetHistory(gn);
  testSettleCarnet(gn);
  testSettleCarnetParcel(gn);
}
