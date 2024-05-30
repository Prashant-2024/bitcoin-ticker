import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  // '?' because value is not being assigned to selectedcurrency because of string? type.
  String? selectedCurrency = "USD";
  int cryptoValue = 0;

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      menuMaxHeight: 350.0,
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) => {
        setState(() {
          selectedCurrency = value;
        })
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> cupertinoChildrens = [];
    for (String currency in currenciesList) {
      var newChild = Text(currency);
      cupertinoChildrens.add(newChild);
    }
    return CupertinoPicker(
      itemExtent: 40.0,
      onSelectedItemChanged: (selectedindex) {
        print(selectedindex);
      },
      children: cupertinoChildrens,
    );
  }

  void getCryptoValue() async {
    var cryptoData = await CoinModel().getCoinRate('BTC');
    cryptoValue = cryptoData['rate'].toInt();
    // print(cryptoValue);
  }

  @override
  Widget build(BuildContext context) {
    getCryptoValue();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("🤑 Crypto Ticker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InfoCard(
                crypto: "BTC",
                currency: "USD",
                value: cryptoValue,
              )
            ],
          ),
          Container(
            height: 150.0,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            child: Platform.isAndroid ? androidDropDown() : iOSPicker(),
          )
        ],
      ),
    );
  }
}
