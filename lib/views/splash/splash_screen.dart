import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_coding/views/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
    const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices splashServices=SplashServices();
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:Center(
        child:Icon(Icons.login),
      ),
    );
  }
}
