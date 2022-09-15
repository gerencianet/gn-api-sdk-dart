import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/charge/createCharge.dart';
import '../../../example/default/charge/payChargeBillet.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testCreateChargeBillet(gn);
}

dynamic testCreateChargeBillet(Gerencianet gn) async {
  test('charge create banking billet', () async {
    dynamic charge = _verifyCreateCharge(await createCharge(gn));
    _verifyCreatePay(await payCharge(gn, charge['data']['charge_id']));
  });
}

void _verifyCreatePay(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(
      response['data'].keys.toList(),
      equals([
        'barcode',
        'pix',
        'link',
        'billet_link',
        'pdf',
        'expire_at',
        'charge_id',
        'status',
        'total',
        'payment'
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
