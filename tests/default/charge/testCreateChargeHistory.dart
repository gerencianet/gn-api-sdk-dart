import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/default/charge/createCharge.dart';
import '../../../examples/default/charge/createChargeHistory.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testCreateChargeHistory(gn);
}

dynamic testCreateChargeHistory(Gerencianet gn) async {
  test('charge create history', () async {
    dynamic charge = _verifyCreateCharge(await createCharge(gn));
    _verifyCreateChargeHistory(
        await createChargeHistory(gn, charge['data']['charge_id']));
  });
}

void _verifyCreateChargeHistory(dynamic response) {
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
