import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openship/tabs/container_registration.dart';
import 'package:openship/tabs/search_form.dart';

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
                Tab(text: 'BUYER'),
                Tab(text: 'SELLER'),
              ],
            ),
          ),
              body: SingleChildScrollView(
                child: Center(
                  child: ContainerRegistration(),
                ),
              ),
      ),
    );
  }
}
