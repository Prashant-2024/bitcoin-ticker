import 'package:http/http.dart' as http;
import 'dart:convert';

const cryptoApiUrl = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '4A9F1621-97AC-43D5-BCBA-CC082C1F8F40';

class NetworkHelper {
  NetworkHelper({required this.url});

  final String url;

  Future getCryptoData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

class CoinModel {
  Future getCoinRate(String crypto) async {
    NetworkHelper networkHelper =
        NetworkHelper(url: '$cryptoApiUrl/BTC/USD?apikey=$apiKey');
    var cryptoData = await networkHelper.getCryptoData();
    return cryptoData;
  }
}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {}
