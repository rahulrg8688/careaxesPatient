import 'package:flutter/cupertino.dart';

class NavigationService {
  static final NavigationService instance = NavigationService._internal();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  NavigationService._internal();

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    final navigator = navigationKey.currentState;
    if (navigator != null) {
      return navigator.pushNamed(routeName, arguments: arguments);
    }
    return Future.error('Navigation state is null');
  }

  Future<dynamic> pushNamedIfNotCurrent(String routeName, {Object? arguments}) {
    if (!isCurrentRoute(routeName)) {
      return pushNamed(routeName, arguments: arguments);
    }
    return Future.value(null);
  }

  bool isCurrentRoute(String routeName) {
    final navigator = navigationKey.currentState;
    if (navigator == null) {
      return false; // or handle it as needed
    }

    bool isCurrent = false;
    navigator.popUntil((route) {
      if (route.settings.name == routeName) {
        isCurrent = true;
      }
      return true;
    });
    return isCurrent;
  }
  Future<dynamic> pushNamedAndRemoveUntil(String newRouteName, bool Function(Route<dynamic>) predicate, {Object? arguments}) {
    final navigator = navigationKey.currentState;
    if (navigator != null) {
      return navigator.pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);
    }
    return Future.error('Navigation state is null');
  }
}
