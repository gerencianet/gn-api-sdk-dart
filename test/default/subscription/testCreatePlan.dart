import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/subscription/createPlan.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testCreatePlan(gn);
}

dynamic testCreatePlan(Gerencianet gn) async {
  test('plan create', () async {
    _verifyCreatePlan(await createPlan(gn));
  });
}

dynamic _verifyCreatePlan(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(response['data'].keys.toList(),
      equals(['plan_id', 'name', 'interval', 'repeats', 'created_at']));
  return response;
}
