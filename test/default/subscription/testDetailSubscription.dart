import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/subscription/detailSubscription.dart';
import '../../../example/default/subscription/createSubscription.dart';
import '../../../example/default/subscription/createPlan.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testDetailSubscription(gn);
}

dynamic testDetailSubscription(Gerencianet gn) async {
  test('subscription detail', () async {
    dynamic plan = _verifyCreatePlan(await createPlan(gn));
    dynamic subscription = _verifyCreateSubscription(
        await createSubscription(gn, plan['data']['plan_id']));
    _verifyDetailSubscription(
        await detailSubscription(gn, subscription['data']['subscription_id']));
  });
}

dynamic _verifyDetailSubscription(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(
      response['data'].keys.toList(),
      equals([
        'subscription_id',
        'value',
        'status',
        'custom_id',
        'notification_url',
        'payment_method',
        'next_execution',
        'next_expire_at',
        'plan',
        'occurrences',
        'created_at',
        'history'
      ]));
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
