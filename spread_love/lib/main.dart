import 'package:flutter/material.dart';
import 'package:spread_love/login.dart';
import 'package:spread_love/purchase.dart';
import 'package:spread_love/transaction_list.dart';

void main() => runApp(SpreadLove());

class SpreadLove extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: 'login',
      routes: {
        'login': (context) => Login(),
        'transactions': (context) => TransactionList(),
        'purchase': (context) => Purchases(),
      },
    );
  }
}
