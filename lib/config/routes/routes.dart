import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_coding/config/routes/routes_name.dart';

import '../../views/home/home_screen.dart';
import '../../views/login/login_screen.dart';
import '../../views/splash/splash_screen.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen:
        return  MaterialPageRoute(builder: (context)=> const SplashScreen());
      case RoutesName.loginScreen:
        return  MaterialPageRoute(builder: (context)=> LoginScreen());
      case RoutesName.homeScreen:
        return  MaterialPageRoute(builder: (context)=>const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body:Center(child: Text('No routes found')),
          );

        });
    }
  }
}