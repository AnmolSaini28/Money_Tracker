import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/constants/colors.dart';
import 'package:trackizer/controller/report_controller.dart';
import 'package:trackizer/controller/transaction_controller.dart';
import 'package:trackizer/controller/transaction_details_controller.dart';
import 'package:trackizer/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReportController()),
        ChangeNotifierProvider(create: (_) => TransactionController()),
        ChangeNotifierProvider(create: (_) => TransDetailController()),
      ],
      child: MaterialApp(
        title: 'Day Manager',
        theme: ThemeData(
            primaryColor: primaryColor, scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}