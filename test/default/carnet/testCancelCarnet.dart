import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/carnet/cancelCarnet.dart';
import '../../../example/default/carnet/createCarnet.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testCancelCarnet(gn);
}

dynamic testCancelCarnet(Gerencianet gn) async {
  test('carnet cancel', () async {
    dynamic carnet = _verifyCreateCarnet(await createCarnet(gn));
    _verifyCancelCarnet(await cancelCarnet(gn, carnet['data']['carnet_id']));
  });
}

void _verifyCancelCarnet(dynamic response) {
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
