import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/default/subscription/getPlans.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testGetPlans(gn);
}

dynamic testGetPlans(Gerencianet gn) async {
  test('plan get', () async {
    _verifyGetPlans(await getPlans(gn));
  });
}

dynamic _verifyGetPlans(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  return response;
}
