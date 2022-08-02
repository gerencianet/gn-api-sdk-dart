import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/charge/createChargeOneStep.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testOneStepBillet(gn);
}

dynamic testOneStepBillet(Gerencianet gn) async {
  test('charge create one step billet', () async {
    _verifyCreateCharge(await createChargeOneStep(gn));
  });
}

dynamic _verifyCreateCharge(dynamic response) {
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
