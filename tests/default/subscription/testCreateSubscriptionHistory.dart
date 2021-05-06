import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/default/subscription/createSubscriptionHistory.dart';
import '../../../examples/default/subscription/createSubscription.dart';
import '../../../examples/default/subscription/createPlan.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testCreateSubscriptionHistory(gn);
}

dynamic testCreateSubscriptionHistory(Gerencianet gn) async {
  test('subscription create history', () async {
    dynamic plan = _verifyCreatePlan(await createPlan(gn));
    dynamic subscription = _verifyCreateSubscription(
        await createSubscription(gn, plan['data']['plan_id']));
    _verifyCreateSubscriptionHistory(await createSubscriptionHistory(
        gn, subscription['data']['subscription_id']));
  });
}

dynamic _verifyCreateSubscriptionHistory(dynamic response) {
  expect(response.keys.toList(), equals(['code']));
  expect(response['code'], equals(200));
  return response;
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
