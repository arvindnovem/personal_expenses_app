import 'package:flutter/material.dart';
import './transactions.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transactions> transactions = [
    Transactions(
      id: 't1',
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: "New Dress",
      amount: 89.99,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("PICKUP"),
                elevation: 5,
              )),
          Column(
              children: transactions.map((tx) {
            return Card(
                child: Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${tx.amount}', //String interpolation
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    )),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(tx.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(DateFormat().format(tx.date),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ]),
              ],
            ));
          }).toList())
        ]));
  }
}
