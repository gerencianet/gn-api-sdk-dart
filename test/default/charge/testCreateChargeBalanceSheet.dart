import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/charge/createChargeBalanceSheet.dart';
import '../../../example/default/charge/createCharge.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testCreateChargeBalanceSheet(gn);
}

dynamic testCreateChargeBalanceSheet(Gerencianet gn) async {
  test('charge create balance sheet', () async {
    dynamic charge = _verifyCreateCharge(await createCharge(gn));
    _verifyCreateChargeBalanceSheet(
        await createChargeBalanceSheet(gn, charge['data']['charge_id']));
  });
}

void _verifyCreateChargeBalanceSheet(dynamic response) {
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
