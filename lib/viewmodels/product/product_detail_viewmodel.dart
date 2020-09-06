import 'package:analytics_playground/models/product.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductDetailViewModel {
  static ProductDetailViewModel of(BuildContext context, Product product) =>
      ProductDetailViewModel(Provider.of<FirebaseAnalytics>(context), product);

  final FirebaseAnalytics _analytics;
  final Product product;
  ProductDetailViewModel(this._analytics, this.product) {
    _analytics.logViewItem(
      itemId: "${product.id}",
      itemName: product.name,
      itemCategory: '',
    );
  }

  void confirmOrder() {
    _analytics.logEcommercePurchase(
      currency: 'JPY',
      value: product.price * 1.0,
    );
  }
}
