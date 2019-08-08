import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openship/Components/background.dart';
import 'package:openship/tabs/search_form.dart';
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
        body: SingleChildScrollView(
          child: Center(
            child: SearchForm(),
            ),
        ),
      ),
    );
  }
}
