import 'package:analytics_playground/views/product/product_list_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        settings: RouteSettings(name: 'home'),
        builder: (_) => HomeView(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: [
              RaisedButton(
                child: Text('Go Products!'),
                onPressed: () {
                  Navigator.push(context, ProductListView.route());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
