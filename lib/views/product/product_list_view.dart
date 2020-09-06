import 'package:analytics_playground/viewmodels/product/product_list_viewmodel.dart';
import 'package:analytics_playground/views/product/product_card.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        settings: RouteSettings(name: 'product/list'),
        builder: (_) => ProductListView(),
      );

  @override
  Widget build(BuildContext context) {
    final vm = ProductListViewModel.of(context);

    final handler = vm.loadProducts((products) {
      final cards = products.map((_) => ProductCard(_)).toList();

      return ListView(
        children: cards,
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Container(
        child: FutureBuilder(
          future: handler,
          builder: (_, snapshot) {
            return snapshot.data ?? Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
