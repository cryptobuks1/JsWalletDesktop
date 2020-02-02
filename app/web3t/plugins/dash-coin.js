// Generated by LiveScript 1.6.0
(function(){
  var mainnet, testnet, txTypes, color, type, enabled, token, image, usdInfo, out$ = typeof exports != 'undefined' && exports || this;
  out$.mainnet = mainnet = {
    decimals: 8,
    txFee: '0.0004',
    txFeeOptions: {
      cheap: '0.0001',
      auto: '0.0004',
      instantPerInput: '0.001',
      privatePerInput: '0.05',
      feePerByte: '0.0000001'
    },
    mask: 'X000000000000000000000000000000000',
    api: {
      provider: 'insight',
      url: 'https://insight.dash.org',
      mixingInfo: "url(https://mydashwallet.org/GeneratePrivateSendAddress?toAddress=:address)",
      decimal: 8
    },
    messagePrefix: '\x19DarkCoin Signed Message:\n',
    bip32: {
      'public': 0x02fe52f8,
      'private': 0x02fe52cc
    },
    pubKeyHash: 0x4c,
    scriptHash: 0x10,
    wif: 0xcc,
    dustThreshold: 5460
  };
  out$.testnet = testnet = {
    incorrect: true,
    decimals: 8,
    txFee: '0.0001',
    txFeeOptions: {
      auto: '0.0004',
      cheap: '0.0001',
      feePerByte: '0.0000001'
    },
    mask: 'y000000000000000000000000000000000',
    topup: 'https://test.faucet.dashninja.pl/',
    api: {
      provider: 'insight',
      url: 'https://test.insight.dash.siampm.com',
      decimal: 8
    },
    messagePrefix: '\x19DarkCoin Signed Message:\n',
    bip32: {
      'public': 0x02fe52f8,
      'private': 0x02fe52cc
    },
    pubKeyHash: 0x8c,
    scriptHash: 0x13,
    wif: 0xef,
    dustThreshold: 5460
  };
  out$.txTypes = txTypes = ['regular', 'instant'];
  out$.color = color = '#649BF6';
  out$.type = type = 'coin';
  out$.enabled = enabled = true;
  out$.token = token = 'dash';
  out$.image = image = "data:image/png;base64,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";
  out$.usdInfo = usdInfo = "url(https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC,DASH,XEM,USDT,ETC&tsyms=USD).DASH.USD";
}).call(this);
