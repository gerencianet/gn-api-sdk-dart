import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';
import '../gn/tests.dart';
import 'charge/test.dart';
import 'location/test.dart';
import 'pix/test.dart';
import 'webhook/test.dart';

void main() {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testsPix(gn, "");
}

void testsPix(Gerencianet gn, String url) {
  testsGn(gn);
  testsCharge(gn);
  testsLocation(gn);
  testsPixPix(gn);
  testsWebHook(gn, url);
}
