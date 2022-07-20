<h1 align="center">Exemplos Plugin Gerencianet</h1>

![SDK Gerencianet para PHP](https://media-exp1.licdn.com/dms/image/C4D1BAQH9taNIaZyh_Q/company-background_10000/0/1603126623964?e=2159024400&v=beta&t=coQC_AK70vTYL3NdvbeIaeYts8nKumNHjvvIGCmq5XA)

---

<h1 align="center">API Emissões</h1>

## Endpoints: Transações


| Descrição | Exemplo |
|------------------------------------------------|------------------|
|Criar nova transação com pagador atribuido                                           |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/oneStepBillet.dart)|
|Criar nova transação                                                                 |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/createCharge.dart)|
|Retornar informações de transação existente                                          |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/detailCharge.dart)|
|Incluir informações como "notification_url" e "custom_id" em uma transação existente |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/updateChargeMetadata.dart)|
|Alterar data de vencimento de uma transação existente                                |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/updateBillet.dart)|
|Cancelar uma transação existente                                                     |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/cancelCharge.dart)|
|Associa método de pagamento à uma transação já criada                                |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/payChargeBillet.dart)|
|Reenvio do boleto bancário para o e-mail desejado                                    |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/resendBillet.dart)|
|Acrescentar descrição ao histórico de uma transação                                  |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/createChargeHistory.dart)|
|Retorna um link para uma tela de pagamento da Gerencianet                            |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/linkCharge.dart)|
|Alterar determinados parâmetros/atributos de um link de pagamento existente          |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/updateChargeLink.dart)|
|Define que a transação será do tipo boleto balancete                                 |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/createChargeBalanceSheet.dart)|
|Permite marcar como pago (baixa manual) uma determinada transação                    |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/charge/settleCharge.dart)|
---
## Endpoints: Carnês


| Descrição | Exemplo |
|------------------------------------------------|------------------|
|Cria um carnê                                                                    |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/carnet/createCarnet.dart)|
|Retorna informações de carnê existente                                           |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/carnet/detailCarnet.dart)|
|Incluir informações como "notification_url" e "custom_id" em um carnê existente  |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/carnet/updateCarnetMetadata.dart)|
|Alterar data de vencimento de parcela específica de um carnê                     |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/carnet/updateParcel.dart)|
|Cancela um determinado carnê                                                     |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/carnet/cancelCarnet.dart)|
|Cancelamento de parcela específica de um carnê existente                         |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/carnet/cancelParcel.dart)|
|Reenviar carnê por e-mail                                                        |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/carnet/resendCarnet.dart)|
|Reenviar por e-mail determinada parcela de um carnê                              |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/carnet/resendParcel.dart)|
|Acrescentar informações ao histórico de um carnê                                 |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/carnet/createCarnetHistory.dart)|
|Permite marcar como pago (baixa manual) uma determinada parcela de um carnê      |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/carnet/settleCarnetParcel.dart)|
---
## Endpoints: Notificações

| Descrição | Exemplo |
|------------------------------------------------|------------------|
|Retorna o histórico de notificações enviadas a uma determinada transação   |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/notifications/getNotification.dart)|

---
## Endpoints: Assinaturas

| Descrição | Exemplo |
|------------------------------------------------|------------------|
|Cria o plano de assinatura       |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/subscription/createPlan.dart)|
|Retorna informações de um ou mais planos              |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/subscription/getPlans.dart)|
|Permite a alteração (edição) do nome de um plano de assinatura pré-existente                 |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/subscription/updatePlan.dart)|
|Cancela um plano de assinatura                                     |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/subscription/cancelSubscription.dart)|
|Cria assinaturas para vincular a planos                                                      |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/subscription/createSubscription.dart)|
|Retorna informações de uma assinatura vinculada a um plano                                   |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/subscription/detailSubscription.dart)|
|Cancelar inscrições ativas em um plano de assinaturas                                        |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/subscription/cancelSubscription.dart)|
|Alterar URL de notificação ("notification_url") e/ou "custom_id" em uma assinatura existente |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/subscription/updateSubscriptionMetadata.dart)|
|Associa método de pagamento à uma assinatura já criada                                       |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/subscription/paySubscription.dart)|
|Acrescenta descrição ao histórico de uma assinatura                                          |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/subscription/createSubscriptionHistory.dart)|
---
## Endpoints: Outros

| Descrição | Exemplo |
|------------------------------------------------|------------------|
|Listar parcelas, de acordo com a bandeira do cartão de crédito. Bandeiras disponíveis: visa, mastercard, amex, diners, elo e hipercard.                                       |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/default/others/getInstallments.dart)|



## Endpoints: Cobranças

| Descrição | Exemplo |
|------------------------------------------------|------------------|
|Criar cobrança imediata (sem txid)              |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/charge/pixCreateImmediateCharge.dart)|
|Criar cobrança imediata (com txid)              |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/charge/pixCreateCharge.dart)|
|Revisar cobrança                                |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/charge/pixUpdateCharge.dart)|
|Consultar cobrança                              |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/charge/pixDetailCharge.dart)|
|Consultar lista de cobranças                    |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/charge/pixListCharges.dart)|

---
## Endpoints: PIX

| Descrição | Exemplo |
|------------------------------------------------|------------------|
|Consultar Pix                                 |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/pix/pixDetail.dart)|
|Consultar Pix recebidos                       |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/pix/pixListReceived.dart)|
|Requisitar envio de Pix                       |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/pix/pixSend.dart)|
|Solicitar devolução                           |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/pix/pixDevolution.dart)|
|Consultar devolução                           |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/pix/pixDetailDevolution.dart)|

---
## Endpoints: Payload locations

| Descrição | Exemplo |
|------------------------------------------------|------------------|
|Criar location do payload                                 |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/location/pixCreateLocation.dart)|
|Consultar locations cadastradas                              |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/location/pixListLocation.dart)|
|Recuperar location do payload                                 |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/location/pixDetailLocation.dart)|
|Gerar QR Code de um location                             |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/location/pixGenerateQRCode.dart)|
|Desvincular um txid de uma location                             |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/location/pixUnsetTxid.dart)|

---
## Endpoints: Webhooks

| Descrição | Exemplo |
|------------------------------------------------|------------------|
|Configurar o webhook Pix                                 |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/webhook/webhookUrl.dart)|
|Exibir informações do wehook Pix                            |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/webhook/pixDetailWebhook.dart)|
|Consultar lista de webhooks                                 |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/webhook/pixListWebhook.dart)|
|Cancelar o webhook Pix                             |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/pix/webhook/pixDeleteWebhook.dart)|


---
## Endpoints: Endpoints exclusivos Gerencianet

| Descrição | Exemplo |
|------------------------------------------------|------------------|
|Criar chave evp                                 |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/gn/key/gnCreateEvp.dart)|
|Listar chaves evp                            |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/gn/key/gnListEvp.dart)|
|Remover chave evp                                |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/gn/key/gnDeleteEvp.dart)|
|Buscar o saldo da conta                             |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/gn/account/gnDetailBalance.dart)|
|Criar/modificar configurações da conta                             |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/gn/account/gnUpdateSettings.dart)|
|Listar configurações da conta                          |[Visualizar](https://github.com/gerencianet/gn-api-sdk-dart/blob/main/example/gn/account/gnDetailSettings.dart)|
---
