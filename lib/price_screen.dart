import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  // '?' because value is not being assigned to selectedcurrency because of string? type.
  String? selectedCurrency = "USD";

  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }

  List<Text> getCupertinoChildren() {
    List<Text> cupertinoChildrens = [];
    for (String currency in currenciesList) {
      var newChild = Text(currency);
      cupertinoChildrens.add(newChild);
    }
    return cupertinoChildrens;
  }

  @override
  Widget build(BuildContext context) {
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
              InfoCard(crypto: "BTC", currency: "USD"),
              InfoCard(crypto: "ETH", currency: "USD"),
              InfoCard(crypto: "ETH", currency: "USD"),
            ],
          ),
          Container(
            height: 150.0,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            child: CupertinoPicker(
              itemExtent: 40.0,
              onSelectedItemChanged: (selectedindex) {
                print(selectedindex);
              },
              children: getCupertinoChildren(),
            ),
          )
        ],
      ),
    );
  }
}

// DropdownButton<String>(
// menuMaxHeight: 350.0,
// value: selectedCurrency,
// items: getDropDownItems(),
// onChanged: (value) => {
// setState(() {
// selectedCurrency = value;
// })
// },
// ),
