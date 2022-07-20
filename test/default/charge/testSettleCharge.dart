import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/charge/settleCharge.dart';
import '../../../example/default/charge/createCharge.dart';
import '../../../example/default/charge/payChargeBillet.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testSettleCharge(gn);
}

dynamic testSettleCharge(Gerencianet gn) async {
  test('charge settle', () async {
    dynamic charge = _verifyCreateCharge(await createCharge(gn));
    _verifyCreatePay(await payCharge(gn, charge['data']['charge_id']));
    _verifySettleCharge(await settleCharge(gn, charge['data']['charge_id']));
  });
}

void _verifyCreatePay(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(
      response['data'].keys.toList(),
      equals([
        'barcode',
        'link',
        'pdf',
        'expire_at',
        'charge_id',
        'status',
        'total',
        'payment'
      ]));
  return response;
}

void _verifySettleCharge(dynamic response) {
  expect(response.keys.toList(), equals(['code']));
  expect(response['code'], equals(200));
  return response;
}

dynamic _verifyCreateCharge(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(
      response['data'].keys.toList(),
      equals([
        'charge_id',
        'status',
        'total',
        'custom_id',
        'created_at',
      ]));
  return response;
}
