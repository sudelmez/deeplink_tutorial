import 'package:deeplink_tutorial/product/home.dart';
import 'package:deeplink_tutorial/product/second.dart';
import 'package:flutter/cupertino.dart';
import 'navigation_paths.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route generateRoute(RouteSettings args, {Uri? url}) {
    switch (args.name) {
      case NavigationPaths.home:
        Map<String, dynamic> arguments = args.arguments as Map<String, dynamic>;
        String? text = arguments["text"];
        return normalNavigate(SecondView(
          text: text,
        ));
      default:
        return normalNavigate(const HomeView());
    }
  }

  PageRoute normalNavigate(Widget widget) {
    return CupertinoPageRoute(builder: (context) => widget);
  }

  PageRoute normalNavigateToPop(Widget widget) {
    return CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true);
  }
}
