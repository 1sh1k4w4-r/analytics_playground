import 'package:analytics_playground/models/product.dart';
import 'package:analytics_playground/views/product/product_detail_view.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  final _expandedRow = (Widget child) => Row(
        children: [
          Expanded(
            child: child,
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, ProductDetailView.route(product));
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(4.0),
          child: Column(
            children: [
              _expandedRow(Text(product.name)),
              _expandedRow(Text(
                '${product.price} 円',
                textAlign: TextAlign.right,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
