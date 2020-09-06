import 'package:analytics_playground/models/product.dart';
import 'package:analytics_playground/repositories/product_repository.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListViewModel {
  static ProductListViewModel of(BuildContext context) => ProductListViewModel(
      Provider.of<ProductRepository>(context),
      Provider.of<FirebaseAnalytics>(context));

  final ProductRepository _productRepository;
  final FirebaseAnalytics _analytics;
  ProductListViewModel(this._productRepository, this._analytics) {
    _analytics.logViewItemList(itemCategory: '');
  }

  Future<Widget> loadProducts(
    Widget Function(List<Product>) onSuccess,
  ) {
    return _productRepository
        .getAllProducts()
        .then((value) => onSuccess(value));
  }
}
