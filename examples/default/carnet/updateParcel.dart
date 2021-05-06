import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await updateParcel(gn, 0, 0);
  print(response);
}

dynamic updateParcel(Gerencianet gn, int carnetId, int parcel) async {
  Map<String, dynamic> params = {'id': carnetId, 'parcel': parcel};
  dynamic body = {'expire_at': '2021-12-12'};
  return await gn.call('updateParcel', params: params, body: body);
}
