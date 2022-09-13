import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/charge/oneStepBillet.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testOneStepCard(gn, "");
}

dynamic testOneStepCard(Gerencianet gn, paymentToken) async {
  test('charge create one step card', () async {
    _verifyCreateCharge(await createChargeOneStep(gn, paymentToken));
  });
}

dynamic _verifyCreateCharge(dynamic response) {
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
