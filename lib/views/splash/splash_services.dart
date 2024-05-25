import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_clean_coding/config/routes/routes_name.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(const Duration(seconds:5), () {
      print("Navigating to login screen...");
      Navigator.pushNamed(
          context, RoutesName.loginScreen,);
    });
  }
}