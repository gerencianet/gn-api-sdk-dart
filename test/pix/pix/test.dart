import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';
import 'testPixDetail.dart';
import 'testPixDetailDevolution.dart';
import 'pixListReceived.dart';

main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testsPixPix(gn);
}

void testsPixPix(Gerencianet gn) {
  testPixListReceived(gn);
  testPixDetail(gn);
  testPixDetailDevolution(gn);
}
