import 'package:analytics_playground/module.dart';
import 'package:analytics_playground/utils/custom_firebase_analytics_observer.dart';
import 'package:analytics_playground/views/splash/splash_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  final AbstractModule module;

  Application(this.module);

  @override
  Widget build(BuildContext context) {
    return module.configure(
      builder: (context) {
        final analytics = Provider.of<FirebaseAnalytics>(context);

        return MaterialApp(
          title: 'Analytics Playground',
          home: SplashView(),
          navigatorObservers: [
            CustomFirebaseAnalyticsObserver(analytics: analytics),
          ],
        );
      },
    );
  }
}
