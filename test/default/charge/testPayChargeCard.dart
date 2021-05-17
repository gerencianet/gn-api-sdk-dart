import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/charge/payChargeCard.dart';
import '../../../example/default/charge/createCharge.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testPayChargeCard(gn, "");
}

dynamic testPayChargeCard(Gerencianet gn, String paymentToken) async {
  test('charge create credit card', () async {
    dynamic charge = _verifyCreateCharge(await createCharge(gn));
    _verifyCreatePay(
        await payCharge(gn, charge['data']['charge_id'], paymentToken));
  });
}

void _verifyCreatePay(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(
      response['data'].keys.toList(),
      equals([
        'installments',
        'installment_value',
        'charge_id',
        'status',
        'total',
        'payment',
      ]));
  return response;
}

dynamic _verifyCreateCharge(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(response['data'].keys.toList(),
      equals(['charge_id', 'status', 'total', 'custom_id', 'created_at']));
  return response;
}
