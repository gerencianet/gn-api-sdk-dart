import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

import 'testGetInstallments.dart';

main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testsOthers(gn);
}

void testsOthers(Gerencianet gn) {
  testGetInstallments(gn);
}
