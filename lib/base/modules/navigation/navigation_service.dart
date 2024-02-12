import 'package:flutter/material.dart';

abstract class BaseNavigationService {
  Future navigateToPage({required String path, Object? arguments});
  Future<void> navigatePop<T extends Object?>({T res});
}

class NavigationService implements BaseNavigationService {
  static NavigationService? _instance;
  static NavigationService get instance {
    _instance ??= NavigationService._init();
    return _instance!;
  }

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  removeOldRoutes() => (Route<dynamic> route) => false;

  @override
  Future navigateToPage({required String path, Object? arguments}) async {
    return await navigatorKey.currentState!.pushNamed(path, arguments: arguments);
  }

  @override
  Future<void> navigatePop<T extends Object?>({T? res}) async {
    return navigatorKey.currentState!.pop<T>(res);
  }
}
