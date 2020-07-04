import 'dart:convert';
import 'package:http/http.dart' ;

class CoinRate{
  String url;
  var decodedData;
  String price;
  Future getPrice(crypto,currency)async{

    url = 'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=YOUR API KEY';

   try {
     Response response = await get(url);
     if (response.statusCode == 200) {
       decodedData = jsonDecode(response.body);
       price = decodedData['rate'].toStringAsFixed(2);
       return price;
     }
     else {
       price = '1000';
       return price;
     }
   }
   catch (e){
     print(e);
   }
  }
}
