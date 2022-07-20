import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/charge/detailCharge.dart';
import '../../../example/default/charge/createCharge.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testDetailCharge(gn);
}

dynamic testDetailCharge(Gerencianet gn) async {
  test('charge detail', () async {
    dynamic charge = _verifyCreateCharge(await createCharge(gn));
    _verifyDetailCharge(await detailCharge(gn, charge['data']['charge_id']));
  });
}

void _verifyDetailCharge(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(
      response['data'].keys.toList(),
      equals([
        'charge_id',
        'total',
        'status',
        'custom_id',
        'created_at',
        'notification_url',
        'items',
        'history',
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
