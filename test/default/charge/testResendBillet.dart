import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/charge/resendBillet.dart';
import '../../../example/default/charge/payChargeBillet.dart';
import '../../../example/default/charge/createCharge.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testResendBillet(gn);
}

dynamic testResendBillet(Gerencianet gn) async {
  test('charge resend billet', () async {
    dynamic charge = _verifyCreateCharge(await createCharge(gn));
    _verifyCreatePay(await payCharge(gn, charge['data']['charge_id']));
    _verifyResendBillet(await resendBillet(gn, charge['data']['charge_id']));
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

void _verifyResendBillet(dynamic response) {
  expect(response.keys.toList(), equals(['code']));
  expect(response['code'], equals(200));
  return response;
}

dynamic _verifyCreateCharge(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(response['data'].keys.toList(),
      equals(['charge_id', 'status', 'total', 'custom_id', 'created_at']));
  return response;
}
