import 'package:flutter/material.dart';
import 'package:openship/screens/login/user_id.dart';
import './InputFields.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (new Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Form(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new InputFieldArea(
                (String text) {
                  UserId().name = text;
                },
                hint: "Username",
                obscure: false,
                icon: Icons.person_outline,
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
