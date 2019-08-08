import 'package:intl/intl.dart';

class Constants {
  static final String baseUrl = 'http://ec2-18-185-92-47.eu-central-1.compute.amazonaws.com';
  static final String shipmentsUrl = '/shipments';
  static final showFormatter = new DateFormat('dd-MM-yyyy');
  static final sendFormatter = new DateFormat('yyyy-MM-dd');
}