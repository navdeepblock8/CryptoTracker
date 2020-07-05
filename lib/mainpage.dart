import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coindata.dart';
import 'constants.dart';

class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  String v = 'USD';

  Map <String,String> price ={};
  bool isWaiting = true;
  CoinData coins = CoinData();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    priceList();
  }
  void priceList()async{
    isWaiting = true;
    await coins.exchangeRate(v);
    setState(() {
      price = exchangerate;
      isWaiting = false;
    });


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
      iconEnabledColor: Colors.black,
      icon: Icon(Icons.arrow_downward),
      style: currencyBar,
      underline: Container(
        color: Colors.purple,
      ),
      isDense: true,
      value: v,
      items: newList,
      onChanged: (value){
        isWaiting =true;
        setState(() {
          v = value;
          priceList();
          isWaiting = false;
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
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bitcoin.jpg'),
                fit: BoxFit.cover,
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ExchangeCard(price: isWaiting? '?':price[cryptoList[0]], currencyName: v,coinName: cryptoList[0],),
                ExchangeCard(price: isWaiting? '?':price[cryptoList[1]],currencyName: v,coinName: cryptoList[1],),
                ExchangeCard(price: isWaiting? '?':price[cryptoList[2]],currencyName: v,coinName: cryptoList[2],),
                Container(
                  height: 100.0,
                  alignment: Alignment.center,
                  color: Colors.purple,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Select Currency To Convert',
                        style: currencyBar,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      getDropdownlist()
                    ],
                  )
                )
              ],
            ),
          ),
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
            style: cardBar
          ),
        ),
      ),
    );
  }
}
