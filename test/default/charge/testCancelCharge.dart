import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/charge/createCharge.dart';
import '../../../example/default/charge/cancelCharge.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testCancelCharge(gn);
}

dynamic testCancelCharge(Gerencianet gn) async {
  test('charge cancel', () async {
    dynamic charge = _verifyCreateCharge(await createCharge(gn));
    _verifyCancelCharge(await cancelCharge(gn, charge['data']['charge_id']));
  });
}

void _verifyCancelCharge(dynamic response) {
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
