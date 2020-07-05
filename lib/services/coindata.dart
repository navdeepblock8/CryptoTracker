import 'package:flutter/material.dart';
import 'coinrate.dart';
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

Map<String,String> exchangerate ={};
class CoinData{
  void exchangeRate(currency)async{
    CoinRate rate = CoinRate();
    for(String crypto in cryptoList){
      exchangerate[crypto] = await rate.getPrice(crypto, currency);
    }
  }
}
