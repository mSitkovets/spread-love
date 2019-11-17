import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spread_love/constants.dart' as prefix0;

class Purchases extends StatefulWidget {
  @override
  _PurchasesState createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  double _sliderValue = 10.0;
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
                    setState(() => _sliderValue = newRating);
                  },
                  value: _sliderValue,
                ),
              ),
            ),
            Container(
              width: 50.0,
              alignment: Alignment.center,
              child: Text('${_sliderValue.toInt()}',
                  style: Theme.of(context).textTheme.display1),
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
                  onPressed: updatePercent,
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
  // http.post(url);
}
