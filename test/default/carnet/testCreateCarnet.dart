import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/carnet/createCarnet.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testCreateCarnet(gn);
}

dynamic testCreateCarnet(Gerencianet gn) async {
  test('carnet create', () async {
    _verifyCreateCarnet(await createCarnet(gn));
  });
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
