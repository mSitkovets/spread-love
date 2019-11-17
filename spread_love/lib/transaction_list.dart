import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spread_love/constants.dart' as prefix0;

class TransactionList extends StatefulWidget {
  @override
  TransactionListState createState() => TransactionListState();
}

dynamic data;

class TransactionListState extends State<TransactionList> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var rawData = await http
        .get('http://0ed067b5.ngrok.io/get_transactions')
        .then((onValue) {
      return json.decode(onValue.body);
    });
    setState(() {
      data = rawData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: ListTile(
                    leading: IconButton(
                      // Use the FontAwesomeIcons class for the IconData
                      icon: Icon(FontAwesomeIcons.handHoldingUsd),
                      iconSize: 30.0,
                      onPressed: () {},
                    ),
                    title: Text(
                      "Total Donated: \$" +
                          data["donations"].toStringAsFixed(2),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: Colors.greenAccent,
                      ),
                    ),
                    contentPadding: prefix0.padding,
                    subtitle: Text(
                      "Total Spent: \$" + data['balance'].toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: ListTile(
                    leading: IconButton(
                      // Use the FontAwesomeIcons class for the IconData
                      icon: new Icon(FontAwesomeIcons.heart),
                      iconSize: 20.0,
                      onPressed: () {},
                    ),
                    title: Text(
                      "\$" + data['all_transactions'][0]['amount'].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: prefix0.fontSize,
                        color: Colors.greenAccent,
                      ),
                    ),
                    contentPadding: prefix0.padding,
                    subtitle: Text(
                      "\$" + data['all_transactions'][0]['company'].toString(),
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: ListTile(
                    leading: IconButton(
                      // Use the FontAwesomeIcons class for the IconData
                      icon: new Icon(FontAwesomeIcons.heart),
                      iconSize: 20.0,
                      onPressed: () {},
                    ),
                    title: Text(
                      "\$" + data['all_transactions'][1]['amount'].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: prefix0.fontSize,
                        color: Colors.greenAccent,
                      ),
                    ),
                    contentPadding: prefix0.padding,
                    subtitle: Text(
                      data['all_transactions'][1]['company'].toString(),
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: ListTile(
                    leading: IconButton(
                      // Use the FontAwesomeIcons class for the IconData
                      icon: new Icon(FontAwesomeIcons.heart),
                      iconSize: 20.0,
                      onPressed: () {},
                    ),
                    title: Text(
                      "\$" + data['all_transactions'][2]['amount'].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: prefix0.fontSize,
                        color: Colors.greenAccent,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                    subtitle: Text(
                      data['all_transactions'][2]['company'].toString(),
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: ListTile(
                    leading: IconButton(
                      // Use the FontAwesomeIcons class for the IconData
                      icon: new Icon(FontAwesomeIcons.heart),
                      iconSize: 20.0,
                      onPressed: () {},
                    ),
                    title: Text(
                      "\$" + data['all_transactions'][3]['amount'].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: prefix0.fontSize,
                        color: Colors.greenAccent,
                      ),
                    ),
                    contentPadding: prefix0.padding,
                    subtitle: Text(
                      data['all_transactions'][3]['company'].toString(),
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: prefix0.padding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'purchase');
                },
              ),
              Padding(
                padding: prefix0.padding,
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget myWidget02(Map<String, dynamic> data) {
// Text(
  //   'It doesn\'t matter \nwhat your name is.',
  //   style: TextStyle(
  //     color: Colors.white,
  //     fontSize: 12,
  //     fontWeight: FontWeight.w500,
  //   ),
  //   textAlign: TextAlign.center,
  // );
  List<Widget> list = new List<Widget>();
  for (int i = 0; i < 3; ++i) {
    list.add(Text("h")
        // Card(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: <Widget>[
        //       ListTile(
        //         leading: Icon(Icons.album),
        //         title: Text(
        //           data['all_transactions'][i]['amount'].toStringAsFixed(2),
        //         ),
        //         subtitle: Text(data['all_transactions'][i]['company'].toString()),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
  return Row(children: list);
}
// class TransactionList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List loadedTransaction = [];
//     Transaction transaction = Transaction();
//     for (Category c in transaction.allCategories()) {
//       loadedTransaction.add(TransactionsRepository.loadTransactions(c));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Icon(
//           Icons.favorite,
//           size: 40.0,
//           color: Colors.red,
//         ),
//       ),
//       body: Row(
//         children: <Widget>[
//           ListView.builder(
//             itemCount: loadedTransaction.length,
//             itemBuilder: (context, index) {
//               return Text(loadedTransaction[index]);
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

//class transactionCard extends StatefulWidget {
//  @override
//  _transactionCardState createState() => _transactionCardState();
//}
//
//class _transactionCardState extends State<transactionCard> {
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      child: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          const ListTile(
//            title: Text('Heart Shaker'),
//            subtitle: Text('TWICE'),
//          ),
//        ],
//      ),
//    );
//  }
//}
