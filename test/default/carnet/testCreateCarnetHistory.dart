import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/carnet/createCarnetHistory.dart';
import '../../../example/default/carnet/createCarnet.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testCreateCarnetHistory(gn);
}

dynamic testCreateCarnetHistory(Gerencianet gn) async {
  test('carnet create history', () async {
    dynamic carnet = _verifyCreateCarnet(await createCarnet(gn));
    _verifyCreateCarnetHistory(
        await createCarnetHistory(gn, carnet['data']['carnet_id']));
  });
}

void _verifyCreateCarnetHistory(dynamic response) {
  expect(response.keys.toList(), equals(['code']));
  expect(response['code'], equals(200));
  return response;
}

dynamic _verifyCreateCarnet(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(
      response['data'].keys.toList(),
      equals([
        'carnet_id',
        'status',
        'cover',
        'link',
        'carnet_link',
        'pdf',
        'charges'
      ]));
  return response;
}
