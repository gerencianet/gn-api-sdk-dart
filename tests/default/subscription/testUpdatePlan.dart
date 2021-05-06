import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/default/subscription/updatePlan.dart';
import '../../../examples/default/subscription/createPlan.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testUpdatePlan(gn);
}

dynamic testUpdatePlan(Gerencianet gn) async {
  test('plan update', () async {
    dynamic plan = _verifyCreatePlan(await createPlan(gn));
    _verifyUpdatePlan(await updatePlan(gn, plan['data']['plan_id']));
  });
}

dynamic _verifyUpdatePlan(dynamic response) {
  expect(response.keys.toList(), equals(['code']));
  expect(response['code'], equals(200));
  return response;
}

dynamic _verifyCreatePlan(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(response['data'].keys.toList(),
      equals(['plan_id', 'name', 'interval', 'repeats', 'created_at']));
  return response;
}
