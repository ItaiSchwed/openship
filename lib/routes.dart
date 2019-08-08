import 'package:flutter/material.dart';
import 'package:openship/screens/buyer_shipments/buyer_shipments.dart';
import 'package:openship/screens/login/index.dart';
import 'package:openship/screens/user_menu/index.dart';
import 'package:openship/swagger_classes/shipment.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "Dribbble Animation App",
      debugShowCheckedModeBanner: false,
      home: new LoginScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return new MyCustomRoute(
              builder: (_) => new LoginScreen(),
            );
          case '/user_menu':
            return new MyCustomRoute(
              builder: (_) => new UserMenu(),
            );
          case '/buyer_shipments':
            final List<Shipment> shipments = settings.arguments;
            return new MyCustomRoute(
              builder: (_) => new BuyerShipments(shipments),
            );
          default:
            return new MyCustomRoute(
              builder: (_) => new LoginScreen(),
            );
        }
      },
    ));
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
