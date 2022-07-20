import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response =
      await detailReport(gn, "70878754-7e66-4c8a-a155-d53a3d17d41e");
  print(response);
}

dynamic detailReport(Gerencianet gn, String id) async {
  Map<String, dynamic> params = {"id": id};

  return await gn.call('detailReport', params: params);
}
