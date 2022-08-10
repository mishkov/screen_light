import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xFFFF0000),
      body: Align(
        alignment: const Alignment(0.9, -0.9),
        child: IconButton(
          icon: const Icon(
            Icons.privacy_tip_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            redirectToPrivacyPocily(() {
              const snackBar = SnackBar(
                content: Text(
                  'Cannot open privacy policy',
                ),
              );
              ScaffoldMessenger.maybeOf(context)?.showSnackBar(snackBar);
            });
          },
        ),
      ),
    );
  }

  Future<void> redirectToPrivacyPocily(void Function() onError) async {
    final url = Uri.parse(
        'https://github.com/mishkov/screen_light/blob/master/PRIVACY_POLICY.md');

    if (!await launchUrl(url)) {
      onError();
    }
  }
}
