import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/carnet/settleCarnetParcel.dart';
import '../../../example/default/carnet/createCarnet.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testSettleCarnetParcel(gn);
}

dynamic testSettleCarnetParcel(Gerencianet gn) async {
  test('carnet settle parcel', () async {
    dynamic carnet = _verifyCreateCarnet(await createCarnet(gn));
    _verifySettleCarnetParcel(
        await settleCarnetParcel(gn, carnet['data']['carnet_id'], 1));
  });
}

void _verifySettleCarnetParcel(dynamic response) {
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
