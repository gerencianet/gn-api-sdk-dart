import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/subscription/createSubscription.dart';
import '../../../example/default/subscription/createPlan.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testCreateSubscription(gn);
}

dynamic testCreateSubscription(Gerencianet gn) async {
  test('subscription create', () async {
    dynamic plan = _verifyCreatePlan(await createPlan(gn));
    _verifyCreateSubscription(
        await createSubscription(gn, plan['data']['plan_id']));
  });
}

dynamic _verifyCreateSubscription(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(
      response['data'].keys.toList(),
      equals(
          ['subscription_id', 'status', 'custom_id', 'charges', 'created_at']));
  return response;
}

dynamic _verifyCreatePlan(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(response['data'].keys.toList(),
      equals(['plan_id', 'name', 'interval', 'repeats', 'created_at']));
  return response;
}
