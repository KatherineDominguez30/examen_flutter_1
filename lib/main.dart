import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiendas RD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute:
          AppRouter.generateRoute,
      initialRoute:
          '/welcome',
    );
  }
}

