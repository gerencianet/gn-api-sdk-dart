import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/carnet/detailCarnet.dart';
import '../../../example/default/carnet/createCarnet.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testDetailCarnet(gn);
}

dynamic testDetailCarnet(Gerencianet gn) async {
  test('carnet detail', () async {
    dynamic carnet = _verifyCreateCarnet(await createCarnet(gn));
    _verifyDetailCarnet(await detailCarnet(gn, carnet['data']['carnet_id']));
  });
}

void _verifyDetailCarnet(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(
      response['data'].keys.toList(),
      equals([
        'carnet_id',
        'status',
        'repeats',
        'cover',
        'link',
        'pdf',
        'value',
        'custom_id',
        'notification_url',
        'split_items',
        'charges',
        'created_at',
        'history'
      ]));
  return response;
}

dynamic _verifyCreateCarnet(dynamic response) {
  expect(response.keys.toList(), equals(['code', 'data']));
  expect(response['code'], equals(200));
  expect(response['data'].keys.toList(),
      equals(['carnet_id', 'status', 'cover', 'link', 'pdf', 'charges']));
  return response;
}
