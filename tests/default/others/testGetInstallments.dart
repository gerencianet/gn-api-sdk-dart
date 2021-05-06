import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/default/others/getInstallments.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testGetInstallments(gn);
}

dynamic testGetInstallments(Gerencianet gn) async {
  test('others get installments', () async {
    _verifyGetInstallments(await getInstallments(gn));
  });
}

dynamic _verifyGetInstallments(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(
      response['data'].keys.toList(), equals(['rate', 'name', 'installments']));
  return response;
}
