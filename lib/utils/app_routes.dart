import 'package:flutter/cupertino.dart';
import 'package:shopping/screen/card/view/card_screen.dart';
import 'package:shopping/screen/home/view/home_screen.dart';
import 'package:shopping/screen/splash/view/splash_screen.dart';

Map<String , WidgetBuilder> app_routes={
  '/':(c1)=> const SplashScreen(),
  'home':(c1)=> const HomeScreen(),
  'card':(c1)=> const CardScreen(),
};