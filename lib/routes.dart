import 'package:flutter/material.dart';
import 'package:openship/screens/buyer_bids/buyer_bids.dart';
import 'package:openship/screens/buyer_shipments/buyer_shipments.dart';
import 'package:openship/screens/login/index.dart';
import 'package:openship/screens/user_menu/index.dart';
import 'package:openship/swagger_classes/shipment.dart';
import 'package:openship/screens/container_registration//index.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "Dribbble Animation App",
      debugShowCheckedModeBanner: false,
      home: new ContainerRegistration(),
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
            final int bidDimensions = (settings.arguments
                as Map<String, dynamic>)['bidDimensions'] as int;
            final List<Shipment> shipments = (settings.arguments
                as Map<String, dynamic>)['shipments'] as List<Shipment>;
            return new MyCustomRoute(
              builder: (_) => new BuyerShipments(bidDimensions, shipments),
            );
          case '/container_registration':
            return new MyCustomRoute(
              builder: (_) => new ContainerRegistration(),
              settings: settings,
            );
          case '/buyer_bids':
            return new MyCustomRoute(
              builder: (_) => new BuyerBids(),
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
