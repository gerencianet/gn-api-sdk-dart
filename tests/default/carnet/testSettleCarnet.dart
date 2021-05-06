import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/default/carnet/settleCarnet.dart';
import '../../../examples/default/carnet/createCarnet.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testSettleCarnet(gn);
}

dynamic testSettleCarnet(Gerencianet gn) async {
  test('carnet settle', () async {
    dynamic carnet = _verifyCreateCarnet(await createCarnet(gn));
    _verifySettleCarnet(await settleCarnet(gn, carnet['data']['carnet_id']));
  });
}

void _verifySettleCarnet(dynamic response) {
  expect(response.keys.toList(), equals(['code']));
  expect(response['code'], equals(200));
  return response;
}

dynamic _verifyCreateCarnet(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(response['data'].keys.toList(),
      equals(['carnet_id', 'status', 'cover', 'link', 'pdf', 'charges']));
  return response;
}
