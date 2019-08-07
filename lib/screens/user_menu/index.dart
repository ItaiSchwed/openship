import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openship/Components/background.dart';
import 'package:openship/Components/search.dart';
import 'package:openship/screens/login/styles.dart';

class UserMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: TabBar(
            tabs: [
              Tab(text: 'SELLER'),
              Tab(text: 'BUYER'),
            ],
          ),
        ),
        body: Center(
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SearchForm()
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}
