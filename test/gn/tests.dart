import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';
import 'account/test.dart';
import 'key/test.dart';

main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testsGn(gn);
}

void testsGn(Gerencianet gn) {
  testsKey(gn);
  testsAccount(gn);
}
