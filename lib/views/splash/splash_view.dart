import 'package:analytics_playground/viewmodels/splash/splash_viewmodel.dart';
import 'package:analytics_playground/views/home/home_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = SplashViewModel();

    final loadingContent = FutureBuilder(
      future: vm.fakeLoading().whenComplete(() {
        Navigator.pushReplacement(context, HomeView.route());
      }),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container();
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Analytics Playground'),
            ],
          ),
        );
      },
    );

    return Scaffold(
      body: loadingContent,
    );
  }
}
