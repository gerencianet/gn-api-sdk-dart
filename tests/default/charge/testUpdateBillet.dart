import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/default/charge/updateBillet.dart';
import '../../../examples/default/charge/payChargeBillet.dart';
import '../../../examples/default/charge/createCharge.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testUpdateBillet(gn);
}

dynamic testUpdateBillet(Gerencianet gn) async {
  test('charge update billet', () async {
    dynamic charge = _verifyCreateCharge(await createCharge(gn));
    _verifyPayCharge(await payCharge(gn, charge['data']['charge_id']));
    _verifyUpdateBillet(await updateBillet(gn, charge['data']['charge_id']));
  });
}

dynamic _verifyUpdateBillet(dynamic response) {
  expect(response.keys.toList(), equals(['code']));
  expect(response['code'], equals(200));
  return response;
}

dynamic _verifyPayCharge(dynamic response) {
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

dynamic _verifyCreateCharge(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(response['data'].keys.toList(),
      equals(['charge_id', 'status', 'total', 'custom_id', 'created_at']));
  return response;
}
