import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CustomFirebaseAnalyticsObserver
    extends RouteObserver<PageRoute<dynamic>> {
  final FirebaseAnalytics analytics;
  final void Function(PlatformException) onError;
  final _nameExtractor = defaultNameExtractor;

  CustomFirebaseAnalyticsObserver({
    @required this.analytics,
    this.onError,
  }) {
    assert(analytics != null);
  }

  void _sendScreenView(PageRoute<dynamic> route) {
    final screenName = _nameExtractor(route.settings);
    final screenClass = () {
      if (route.settings.arguments is Map<String, dynamic>) {
        final arguments = route.settings.arguments as Map<String, dynamic>;
        return arguments['screenClass'] ?? screenName;
      }

      return screenName;
    }();

    if (screenName != null) {
      analytics
          .setCurrentScreen(
              screenName: screenName, screenClassOverride: screenClass)
          .catchError(
        (error) {
          if (onError == null) {
            debugPrint('$CustomFirebaseAnalyticsObserver: $error');
          } else {
            onError(error);
          }
        },
        test: (error) => error is PlatformException,
      );
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
    }
  }
}
