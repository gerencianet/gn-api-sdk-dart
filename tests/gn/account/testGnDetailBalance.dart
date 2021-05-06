import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/gn/account/gnDetailBalance.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testGnDetailBalance(gn);
}

dynamic testGnDetailBalance(Gerencianet gn) async {
  test('pix account balance', () async {
    _verifyPixListBalance(await gnDetailBalance(gn));
  });
}

dynamic _verifyPixListBalance(dynamic response) {
  expect(response.keys.toList(), equals(['saldo']));
  return response;
}
