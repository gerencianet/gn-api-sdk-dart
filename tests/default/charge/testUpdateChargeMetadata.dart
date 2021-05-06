import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/default/charge/updateChargeMetadata.dart';
import '../../../examples/default/charge/createCharge.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testUpdateChargeMetadata(gn);
}

dynamic testUpdateChargeMetadata(Gerencianet gn) async {
  test('charge update metadata', () async {
    dynamic charge = _verifyCreateCharge(await createCharge(gn));
    _verifyUpdateChargeMetadata(
        await updateChargeMetadata(gn, charge['data']['charge_id']));
  });
}

dynamic _verifyUpdateChargeMetadata(dynamic response) {
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
