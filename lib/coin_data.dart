import 'dart:convert';
import 'package:http/http.dart' as http;

String apikey = '8A545A69-C02D-4774-B00F-A27982AE9529';
// final uri = Uri.https('rest.coinapi.io', '/v1/exchangerate/BTC/USD', {
//   'apikey': apikey,
// });
class CoinData{

  Future getCoinData(String selectedCurrency) async {
    final http.Response response = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=8A545A69-C02D-4774-B00F-A27982AE9529'));
    String data = response.body;
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(data);
      double currentRate = decodedData['rate'];
      return currentRate.toStringAsFixed(0);
    }
    else{
      print(response.statusCode);
    }
  }
}

