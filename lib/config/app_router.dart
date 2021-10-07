// ignore_for_file: no_duplicate_case_values

import 'package:e_c_shop/models/models.dart';
import 'package:e_c_shop/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_c_shop/screens/screens.dart';
import 'package:e_c_shop/models/models.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route : ${settings.name}');

    switch (settings.name) {
      case '/login':
        return LoginScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
      ),
    );
  }
}
