import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';
import 'testGnDetailBalance.dart';
import 'testGnDetailSettings.dart';
import 'testGnUpdateSettings.dart';

main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testsAccount(gn);
}

void testsAccount(Gerencianet gn) {
  testGnDetailBalance(gn);
  testGnDetailSettings(gn);
  testGnUpdateSettings(gn);
}
