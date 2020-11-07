import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: '/splach',
      theme: ThemeData(
          //主题颜色设置
          primaryColor: Colors.white),
    );
  }
}
