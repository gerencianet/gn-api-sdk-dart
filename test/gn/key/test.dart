import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';
import 'testGnCreateEvp.dart';
import 'test_delete.dart';
import 'testGnListEvp.dart';

main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testsKey(gn);
}

void testsKey(Gerencianet gn) {
  testGnCreateEvp(gn);
  testGnDeleteEvp(gn);
  testGnListEvp(gn);
}
