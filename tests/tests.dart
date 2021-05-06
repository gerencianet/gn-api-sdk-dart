import 'package:gerencianet/gerencianet.dart';

import './credentials.dart';
import 'default/tests.dart';
import 'pix/tests.dart';

main() {
  Gerencianet gnDefault = Gerencianet(CREDENTIALS_DEFAULT);
  CREDENTIALS_PIX['headers'] = {
    'x-skip-mtls-checking': 'true',
  };
  Gerencianet gnPix = Gerencianet(CREDENTIALS_PIX);
  String paymentToken1 = "";
  String paymentToken2 = "";
  String paymentToken3 = "";
  String url = "";
  String notificationToken = "";

  testsDefault(gnDefault, paymentToken1, paymentToken2, paymentToken3,
      notificationToken);
  testsPix(gnPix, url);
}
