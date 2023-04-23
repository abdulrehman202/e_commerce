import 'package:e_commerce/presentation/CartScreen/CartScreen.dart';
import 'package:e_commerce/presentation/ProductDetailScreen/ProductDetailScreen.dart';
import 'package:e_commerce/presentation/productsScreen/ProductsScreen.dart';
import 'package:e_commerce/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/presentation/resources/strings_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String productsScreenRoute = '/productsScreen';
  static const String productDetailScreenRoute = '/ProductDetailScreen';
  static const String CartScreenRoute = '/CartScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());

      case Routes.productDetailScreenRoute:
        return MaterialPageRoute(
            builder: (_) => const ProductDetailScreen(),
            settings: routeSettings);

      case Routes.CartScreenRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());

      default:
        return UnDefinedRoute();
    }
  }

  static Route<dynamic> UnDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
