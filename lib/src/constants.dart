/// This constant stores all the Gerencianet API Endpoints and other information

const Map<String, Map<String, dynamic>> CONSTANTS = {
  'DEFAULT': {
    'URL': {
      'production': 'https://api.gerencianet.com.br/v1',
      'sandbox': 'https://sandbox.gerencianet.com.br/v1'
    },
    'ENDPOINTS': {
      'authorize': {'route': '/authorize', 'method': 'post'},
      'createCharge': {'route': '/charge', 'method': 'post'},
      'detailCharge': {'route': '/charge/:id', 'method': 'get'},
      'updateChargeMetadata': {
        'route': '/charge/:id/metadata',
        'method': 'put'
      },
      'updateBillet': {'route': '/charge/:id/billet', 'method': 'put'},
      'payCharge': {'route': '/charge/:id/pay', 'method': 'post'},
      'cancelCharge': {'route': '/charge/:id/cancel', 'method': 'put'},
      'createCarnet': {'route': '/carnet', 'method': 'post'},
      'detailCarnet': {'route': '/carnet/:id', 'method': 'get'},
      'updateParcel': {'route': '/carnet/:id/parcel/:parcel', 'method': 'put'},
      'updateCarnetMetadata': {
        'route': '/carnet/:id/metadata',
        'method': 'put'
      },
      'getNotification': {'route': '/notification/:token', 'method': 'get'},
      'getPlans': {'route': '/plans', 'method': 'get'},
      'createPlan': {'route': '/plan', 'method': 'post'},
      'deletePlan': {'route': '/plan/:id', 'method': 'delete'},
      'createSubscription': {
        'route': '/plan/:id/subscription',
        'method': 'post'
      },
      'detailSubscription': {'route': '/subscription/:id', 'method': 'get'},
      'paySubscription': {'route': '/subscription/:id/pay', 'method': 'post'},
      'cancelSubscription': {
        'route': '/subscription/:id/cancel',
        'method': 'put'
      },
      'updateSubscriptionMetadata': {
        'route': '/subscription/:id/metadata',
        'method': 'put'
      },
      'getInstallments': {'route': '/installments', 'method': 'get'},
      'resendBillet': {'route': '/charge/:id/billet/resend', 'method': 'post'},
      'createChargeHistory': {'route': '/charge/:id/history', 'method': 'post'},
      'createChargeOneStep': {'route': '/charge/one-step', 'method': 'post'},
      'resendCarnet': {'route': '/carnet/:id/resend', 'method': 'post'},
      'resendParcel': {
        'route': '/carnet/:id/parcel/:parcel/resend',
        'method': 'post'
      },
      'createCarnetHistory': {'route': '/carnet/:id/history', 'method': 'post'},
      'cancelCarnet': {'route': '/carnet/:id/cancel', 'method': 'put'},
      'cancelParcel': {
        'route': '/carnet/:id/parcel/:parcel/cancel',
        'method': 'put'
      },
      'linkCharge': {'route': '/charge/:id/link', 'method': 'post'},
      'chargeLink': {'route': '/charge/:id/link', 'method': 'post'},
      'updateChargeLink': {'route': '/charge/:id/link', 'method': 'put'},
      'updatePlan': {'route': '/plan/:id', 'method': 'put'},
      'createSubscriptionHistory': {
        'route': '/subscription/:id/history',
        'method': 'post'
      },
      'createChargeBalanceSheet': {
        'route': '/charge/:id/balance-sheet',
        'method': 'post'
      },
      'settleCharge': {'route': '/charge/:id/settle', 'method': 'put'},
      'settleCarnetParcel': {
        'route': '/carnet/:id/parcel/:parcel/settle',
        'method': 'put'
      },
      'oneStepSubscription': {
        'route': '/plan/:id/subscription/one-step',
        'method': 'post'
      },
      'oneStepSubscriptionLink': {
        'route': '/plan/:id/subscription/one-step/link',
        'method': 'post'
      },
      'oneStepLink': {'route': '/charge/one-step/link', 'method': 'post'},
      'resendChargeLink': {
        'route': '/charge/:id/link/resend',
        'method': 'post'
      },
      'resendSubscriptionCharge': {
        'route': '/charge/:id/subscription/resend',
        'method': 'post'
      },
      'settleCarnet': {'route': '/carnet/:id/settle', 'method': 'put'},
      'payChargeBillet': {'route': '/charge/:id/pay', 'method': 'post'},
      'payChargeCard': {'route': '/charge/:id/pay', 'method': 'post'},
      'createOneStepSubscription': {
        'route': '/plan/:id/subscription/one-step',
        'method': 'post'
      },
      'resendNotification': {
        'route': '/charge/:id/notification/resend',
        'method': 'get'
      },
      'resendNotificationCarnet': {
        'route': '/carnet/:id/notification/resend',
        'method': 'get'
      }
    }
  },
  'PIX': {
    'URL': {
      'production': 'https://api-pix.gerencianet.com.br',
      'sandbox': 'https://api-pix-h.gerencianet.com.br'
    },
    'ENDPOINTS': {
      'authorize': {'route': '/oauth/token', 'method': 'post'},
      'pixConfigWebhook': {'route': '/v2/webhook/:chave', 'method': 'put'},
      'pixGetWebhook': {'route': '/v2/webhook/:chave', 'method': 'get'},
      'pixListWebhook': {'route': '/v2/webhook', 'method': 'get'},
      'pixDeleteWebhook': {'route': '/v2/webhook/:chave', 'method': 'delete'},
      'pixCreateCharge': {'route': '/v2/cob/:txid', 'method': 'put'},
      'pixCreateImmediateCharge': {'route': '/v2/cob', 'method': 'post'},
      'pixDetailCharge': {'route': '/v2/cob/:txid', 'method': 'get'},
      'pixUpdateCharge': {'route': '/v2/cob/:txid', 'method': 'patch'},
      'pixListCharges': {'route': '/v2/cob', 'method': 'get'},
      'pixGenerateQRCode': {'route': '/v2/loc/:id/qrcode', 'method': 'get'},
      'pixDevolution': {
        'route': '/v2/pix/:e2eId/devolucao/:id',
        'method': 'put'
      },
      'pixDevolutionGet': {
        'route': '/v2/pix/:e2eId/devolucao/:id',
        'method': 'get'
      },
      'pixSend': {'route': '/v2/pix', 'method': 'post'},
      'pixSendPut': {'route': '/v2/gn/pix/:idEnvio', 'method': 'put'},
      'pixSendList': {'route': '/v2/pix/:e2eId', 'method': 'get'},
      'pixDetail': {'route': '/v2/pix/:e2eId', 'method': 'get'},
      'pixReceivedList': {'route': '/v2/pix', 'method': 'get'},
      'pixListReceived': {'route': '/v2/pix', 'method': 'get'},
      'pixLocationCreate': {'route': '/v2/loc', 'method': 'post'},
      'pixLocationList': {'route': '/v2/loc', 'method': 'get'},
      'pixLocationGet': {'route': '/v2/loc/:id', 'method': 'get'},
      'pixLocationDeleteTxid': {
        'route': '/v2/loc/:id/txid',
        'method': 'delete'
      },
      'pixCreateEvp': {'route': '/v2/gn/evp', 'method': 'post'},
      'pixListEvp': {'route': '/v2/gn/evp', 'method': 'get'},
      'pixDeleteEvp': {'route': '/v2/gn/evp/:chave', 'method': 'delete'},
      'pixListBalance': {'route': '/v2/gn/saldo', 'method': 'get'},
      'pixUpdateSettings': {'route': '/v2/gn/config', 'method': 'put'},
      'pixListSettings': {'route': '/v2/gn/config', 'method': 'get'},
      'pixCreateDueCharge': {'route': '/v2/cobv/:txid', 'method': 'put'},
      'pixUpdateDueCharge': {'route': '/v2/cobv/:txid', 'method': 'patch'},
      'pixDetailDueCharge': {'route': '/v2/cobv/:txid', 'method': 'get'},
      'pixListDueCharges': {'route': '/v2/cobv/', 'method': 'get'},
      'createReport': {
        'route': '/v2/gn/relatorios/extrato-conciliacao',
        'method': 'post'
      },
      'detailReport': {'route': '/v2/gn/relatorios/:id', 'method': 'get'}
    }
  },
  'OPEN-FINANCE': {
    'URL': {
      'production': 'https://apis.gerencianet.com.br/open-finance',
      'sandbox': 'https://apis-h.gerencianet.com.br/open-finance'
    },
    'ENDPOINTS': {
      'authorize': {'route': '/oauth/token', 'method': 'post'},
      'ofUpdateSettings': {'route': '/config', 'method': 'put'},
      'ofDetailSettings': {'route': '/config', 'method': 'get'},
      'ofListParticipants': {'route': '/participantes/', 'method': 'get'},
      'ofStartPixPayment': {'route': '/pagamentos/pix', 'method': 'post'},
      'ofListPixPayment': {'route': '/pagamentos/pix', 'method': 'get'}
    }
  },
  'PAGAMENTOS': {
    'URL': {
      'production': 'https://apis.gerencianet.com.br/pagamento',
      'sandbox': 'https://apis.gerencianet.com.br/pagamento'
    },
    'ENDPOINTS': {
      'authorize': {'route': '/oauth/token', 'method': 'post'},
      'payDetailBarCode': {'route': '/codBarras/:codBarras', 'method': 'get'},
      'payRequestBarCode': {'route': '/codBarras/:codBarras', 'method': 'post'},
      'payDetailPayment': {'route': '/:idPagamento', 'method': 'get'},
      'payListPayments': {'route': '/resumo', 'method': 'get'}
    }
  },
};
