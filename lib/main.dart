import 'package:deeplink_tutorial/base/modules/deeplink/config.dart';
import 'package:deeplink_tutorial/base/modules/navigation/navigation_service.dart';
import 'package:deeplink_tutorial/product/home.dart';
import 'package:flutter/material.dart';

import 'base/modules/navigation/navigation_routes.dart';

void main() {
  DeepLinkingConfig deepLink = DeepLinkingConfig();
  deepLink.getInitialLink();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DeepLinkingConfig deepLink = DeepLinkingConfig();
  @override
  void didChangeDependencies() {
    deepLink.getLinkStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      title: 'Deeplink Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
