import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coindata.dart';

class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  String v = 'USD';
  var data;
  var coinPrice;
  String price;
  CoinData coins = CoinData();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void priceList(){
    coins.exchangeRate(v);

  }

  DropdownButton getDropdownlist(){
    List<DropdownMenuItem<String>> newList = [];
    for(String currency in currenciesList){
      var listItem=  DropdownMenuItem(
        child: Text(
            currency
        ),
        value: currency,
      );
      newList.add(listItem);
    }
    return DropdownButton(
      focusColor: Colors.purple,
      elevation: 100,
      value: v,
      items: newList,
      onChanged: (value){

        setState(() {
          v = value;
          priceList();
        });
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            'Coin Tracker',
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ExchangeCard(price: exchangerate[cryptoList[0]], currencyName: v,coinName: cryptoList[0],),
            ExchangeCard(price: exchangerate[cryptoList[1]],currencyName: v,coinName: cryptoList[1],),
            ExchangeCard(price: exchangerate[cryptoList[2]],currencyName: v,coinName: cryptoList[2],),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10.0),
              color: Colors.purple,
              child: getDropdownlist()
            )
          ],
        ),
      ),
    );
  }
}

class ExchangeCard extends StatelessWidget {
  ExchangeCard({@required this.price, @required this.currencyName,@required this.coinName});
  final String coinName;
  final String price;
  final String currencyName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.purpleAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
          child: Text(
            '1 $coinName = $price $currencyName',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
