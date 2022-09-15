import 'package:gerencianet/gerencianet.dart';

import '../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await ofListParticipants(gn);
  print(response);
}

dynamic ofListParticipants(Gerencianet gn) async {
  return await gn.call('ofListParticipants');
}
