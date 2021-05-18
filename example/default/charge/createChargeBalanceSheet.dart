import 'package:gerencianet/gerencianet.dart';
import '../../credentials.dart';

void main() async {
  credentials.remove('pix_cert');
  credentials.remove('pix_private_key');
  Gerencianet gn = Gerencianet(credentials);
  dynamic response = await createChargeBalanceSheet(gn, 0);
  print(response);
}

dynamic createChargeBalanceSheet(Gerencianet gn, int chargeId) async {
  dynamic body = {
    "title": "Balancete Demonstrativo",
    "body": [
      {
        "header": "Demonstrativo de Consumo",
        "tables": [
          {
            "rows": [
              [
                {
                  "align": "left",
                  "color": "#000000",
                  "style": "bold",
                  "text": "Exemplo de despesa",
                  "colspan": 2
                },
                {
                  "align": "left",
                  "color": "#000000",
                  "style": "bold",
                  "text": "Total lançado",
                  "colspan": 2
                }
              ],
              [
                {
                  "align": "left",
                  "color": "#000000",
                  "style": "normal",
                  "text": "Instalação",
                  "colspan": 2
                },
                {
                  "align": "left",
                  "color": "#000000",
                  "style": "normal",
                  "text": "R\$ 100,00",
                  "colspan": 2
                }
              ]
            ]
          }
        ]
      },
      {
        "header": "Balancete Geral",
        "tables": [
          {
            "rows": [
              [
                {
                  "align": "left",
                  "color": "#000000",
                  "style": "normal",
                  "text":
                      "Confira na documentação da Gerencianet todas as configurações possíveis.",
                  "colspan": 4
                }
              ]
            ]
          }
        ]
      }
    ]
  };

  Map<String, dynamic> params = {"id": chargeId};

  return await gn.call("createChargeBalanceSheet", params: params, body: body);
}
