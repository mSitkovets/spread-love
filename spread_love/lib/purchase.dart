import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spread_love/constants.dart' as prefix0;

class Purchases extends StatefulWidget {
  @override
  _PurchasesState createState() => _PurchasesState();
}

double sliderValue = 10.0;
final myController = TextEditingController();

class _PurchasesState extends State<Purchases> {
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Purchase"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              "Love you would like to spread",
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: prefix0.padding,
            ),
            Container(
              child: Flexible(
                fit: FlexFit.tight,
                flex: 0,
                // A slider, like many form elements, needs to know its
                // own value and how to update that value.
                //
                // The slider will call onChanged whenever the value
                // changes. But it will only repaint when its value property
                // changes in the state using setState.
                //
                // The workflow is:
                // 1. User drags the slider.
                // 2. onChanged is called.
                // 3. The callback in onChanged sets the sliderValue state.
                // 4. Flutter repaints everything that relies on sliderValue,
                // in this case, just the slider at its new value.
                child: Slider(
                  activeColor: Colors.redAccent,
                  min: 0.0,
                  max: 15.0,
                  onChanged: (newRating) {
                    setState(() => sliderValue = newRating);
                  },
                  value: sliderValue,
                ),
              ),
            ),
            Container(
              width: 100.0,
              alignment: Alignment.center,
              child: Text('${sliderValue.toDouble().toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.display1),
            ),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                hintText: "Organization",
                contentPadding: prefix0.padding,
              ),
            ),
            Padding(
              padding: prefix0.padding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'transactions');
                  },
                ),
                Padding(
                  padding: prefix0.padding,
                ),
                RaisedButton(
                  color: Colors.red,
                  child: Text("Go back"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: prefix0.padding,
                ),
                RaisedButton(
                  onPressed: () {
                    updatePercent();
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the user has entered by using the
                          // TextEditingController.
                          content: Text(myController.text),
                        );
                      },
                    );
                  },
                  child: Text('Submit'),
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void updatePercent() {
  // Text();
  http.get(
      'http://0ed067b5.ngrok.io/emit?company=${myController.text}&category=Tuition&amount=${'${sliderValue.toDouble().toStringAsFixed(2)}'}&current-balance=2000');
}
