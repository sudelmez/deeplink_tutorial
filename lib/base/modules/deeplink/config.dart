import 'dart:async';
import 'package:uni_links/uni_links.dart';
import '../navigation/navigation_paths.dart';
import '../navigation/navigation_service.dart';

class DeepLinkingConfig {
  Uri? initialUri;
  String? initialLink;
  Uri? currentUri;
  StreamSubscription? sub;

  void getInitialLink() async {
    try {
      initialUri = await getInitialUri();
      // initialLink=await getInitialLink();
      if (initialUri!.pathSegments.isNotEmpty) {
        NavigationService.instance.navigateToPage(path: NavigationPaths.second, arguments: {'text': Uri.parse(currentUri.toString()).pathSegments[1]});
      }
    } catch (e) {}
  }

  void getLinkStream() {
    sub = uriLinkStream.listen((Uri? uri) {
      if (uri!.pathSegments.isNotEmpty) {
        currentUri = uri;
        NavigationService.instance.navigateToPage(path: NavigationPaths.second, arguments: {'text': Uri.parse(currentUri.toString()).pathSegments[1]});
      }
    }, onError: (err) {});
  }
}
