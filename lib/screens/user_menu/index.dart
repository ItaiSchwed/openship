import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openship/screens/login/styles.dart';
import 'package:openship/screens/login/user_id.dart';

class UserMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: backgroundImage,
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  const Color.fromRGBO(162, 146, 199, 0.8),
                  const Color.fromRGBO(51, 51, 63, 0.9),
                ],
                stops: [0.2, 1.0],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
              ),
            ),
            child: ListView(
              children: <Widget>[
                Text('UserId: ${UserId().userId}'),
                Text('Name: ${UserId().name}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
