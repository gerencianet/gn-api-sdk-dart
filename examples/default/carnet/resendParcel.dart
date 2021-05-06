import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await resendParcel(gn, 0, 0);
  print(response);
}

dynamic resendParcel(Gerencianet gn, int carnetId, int parcel) async {
  dynamic body = {'email': 'oldbuck@gerencianet.com.br'};
  Map<String, dynamic> params = {'id': carnetId, 'parcel': parcel};
  return await gn.call('resendParcel', params: params, body: body);
}
