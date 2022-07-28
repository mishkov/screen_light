import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ScreenLightApp());
}

class ScreenLightApp extends StatelessWidget {
  const ScreenLightApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Light',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeRoute(),
    );
  }
}

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const Scaffold(
      backgroundColor: Color(0xFFFF0000),
    );
  }
}
