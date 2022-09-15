import 'package:gerencianet/gerencianet.dart';
import 'package:test/test.dart';
import '../../../example/pix/pix/pixDetailDevolution.dart';
import '../../../example/pix/pix/pixListReceived.dart';
import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(CREDENTIALS_PIX);
  testPixDetailDevolution(gn);
}

dynamic testPixDetailDevolution(Gerencianet gn) async {
  test('pix list detail devolution', () async {
    dynamic pix = _verifyPixLocationList(await pixListReceived(gn))['pix'];
    for (final item in pix) {
      if (item.containsKey('devolucoes')) {
        String e2eId = item['endToEndId'];
        String id = item['devolucoes'][0]['id'];
        _verifyPixDevolutionGet(await pixDetailDevolution(gn, e2eId, id));
        break;
      }
    }
  });
}

dynamic _verifyPixLocationList(dynamic response) {
  expect(response.keys.toList(), equals(['parametros', 'pix']));
  return response;
}

dynamic _verifyPixDevolutionGet(dynamic response) {
  expect(response.keys.toList(),
      equals(['id', 'rtrId', 'valor', 'horario', 'status']));
  return response;
}
