import 'package:ewallet_flutter/screens/auth/login.dart';
import 'package:ewallet_flutter/screens/home/home.dart';
import 'package:ewallet_flutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkUserSementara(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wAppLoading(context)
    );
  }

  void _checkUserSementara(bool user) async {
    await Future.delayed(Duration(seconds: 3));

    wPushReplaceTo(context, user ? Home() : Login());
  }
}
