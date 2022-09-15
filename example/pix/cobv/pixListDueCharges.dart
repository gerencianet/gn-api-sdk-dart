import 'package:gerencianet/gerencianet.dart';

import '../../credentials.dart';

void main() async {
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await pixListDueCharges(gn);
  print(response);
}

dynamic pixListDueCharges(Gerencianet gn) async {
  Map<String, dynamic> params = {
    'inicio': '2020-10-22T16:01:35Z',
    'fim': '2022-10-23T16:01:35Z'
  };

  return await gn.call('pixListDueCharges', params: params);
}
