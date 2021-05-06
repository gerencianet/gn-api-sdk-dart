import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await settleCarnetParcel(gn, 0, 0);
  print(response);
}

dynamic settleCarnetParcel(Gerencianet gn, int carnetId, int parcel) async {
  Map<String, dynamic> params = {'id': carnetId, 'parcel': parcel};
  return await gn.call('settleCarnetParcel', params: params);
}
