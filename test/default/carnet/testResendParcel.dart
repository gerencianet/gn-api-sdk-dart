import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/default/carnet/resendParcel.dart';
import '../../../example/default/carnet/createCarnet.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_DEFAULT);
  testResendParcel(gn);
}

dynamic testResendParcel(Gerencianet gn) async {
  test('carnet resend parcel', () async {
    dynamic carnet = _verifyCreateCarnet(await createCarnet(gn));
    _verifyResendParcel(await resendParcel(gn, carnet['data']['carnet_id'], 1));
  });
}

void _verifyResendParcel(dynamic response) {
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
