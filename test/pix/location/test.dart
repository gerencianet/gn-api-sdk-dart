import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';
import 'testPixCreateLocation.dart';
import 'test_delete_get.dart';
import 'testPixUnsetTxid.dart';
import 'testPixListLocation.dart';
import 'testPixGenerateQRCode.dart';

main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testsLocation(gn);
}

void testsLocation(Gerencianet gn) {
  testPixCreateLocation(gn);
  testPixDetailLocation(gn);
  testPixUnsetTxid(gn);
  testPixListLocation(gn);
  testPixGenerateQRCode(gn);
}
