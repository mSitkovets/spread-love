import 'package:flutter/material.dart';
import 'package:spread_love/constants.dart' as prefix0;

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("{ ..."),
          Icon(
            Icons.favorite,
            size: 40.0,
            color: Colors.red,
          ),
          Text("}"),
        ],
      )),
      body: SafeArea(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: prefix0.padding,
                    ),
                    Text(
                      "Welcome to Spread Love. Create an Account",
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: prefix0.padding),
                    Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          hintText: 'Credit Card Number',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(padding: prefix0.padding),
                    TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'CVV',
                        contentPadding: EdgeInsets.all(5.0),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(padding: prefix0.padding),
                    TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'DD/MM',
                        contentPadding: EdgeInsets.all(5.0),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            Navigator.pushNamed(context, 'transactions');
                          }
                        },
                        child: SafeArea(
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: prefix0.fontSize),
                          ),
                        ),
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class Form extends StatelessWidget {
//   const Form({
//     Key key,
//     @required GlobalKey<FormState> formKey,
//   })  : _formKey = formKey,
//         super(key: key);

//   final GlobalKey<FormState> _formKey;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: RaisedButton(
//               onPressed: () {
//                 // Validate returns true if the form is valid, or false
//                 // otherwise.
//                 if (_formKey.currentState.validate()) {
//                   // If the form is valid, display a Snackbar.
//                   Scaffold.of(context)
//                       .showSnackBar(SnackBar(content: Text('Processing Data')));
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text("{ ..."),
//           Icon(
//             Icons.favorite,
//             size: 40.0,
//             color: Colors.red,
//           ),
//           Text("}"),
//         ],
//       )),
//       body: Center(
//         child: RaisedButton(
//           child: Text('Launch screen'),
//           onPressed: () {
//             // Navigate to the second screen using a named route.
//             Navigator.pushNamed(context, 'transactions');
//           },
//         ),
//       ),
//     );
//   }
// }
