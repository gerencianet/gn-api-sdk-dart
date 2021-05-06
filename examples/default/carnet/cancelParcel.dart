import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await cancelCarnetParcel(gn, 0, 0);
  print(response);
}

dynamic cancelCarnetParcel(Gerencianet gn, int carnetId, int parcel) async {
  Map<String, dynamic> params = {'id': carnetId, 'parcel': parcel};
  return await gn.call('cancelParcel', params: params);
}
