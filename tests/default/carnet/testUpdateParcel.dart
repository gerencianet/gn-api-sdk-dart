import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../examples/default/carnet/updateParcel.dart';
import '../../../examples/default/carnet/createCarnet.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testUpdateParcel(gn);
}

dynamic testUpdateParcel(Gerencianet gn) async {
  test('carnet update parcel', () async {
    dynamic carnet = _verifyCreateCarnet(await createCarnet(gn));
    _verifyUpdateParcel(await updateParcel(gn, carnet['data']['carnet_id'], 1));
  });
}

void _verifyUpdateParcel(dynamic response) {
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
