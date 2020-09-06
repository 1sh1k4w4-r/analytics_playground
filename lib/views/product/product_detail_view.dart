import 'package:analytics_playground/models/product.dart';
import 'package:analytics_playground/utils/custom_route_settings.dart';
import 'package:analytics_playground/viewmodels/product/product_detail_viewmodel.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  static route(Product product) => MaterialPageRoute(
        settings: customRouteSettings(
            name: 'product/detail/${product.id}', className: 'product/detail'),
        builder: (_) => ProductDetailView(product),
      );

  final Product product;

  ProductDetailView(this.product);

  @override
  Widget build(BuildContext context) {
    final vm = ProductDetailViewModel.of(context, product);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Container(
                        color: Colors.deepOrange,
                        child: Center(
                          child: Text('image'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product.description,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 500,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.blue,
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${product.price} 円',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              child: Text(
                'Buy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                final isOrderConfirm = await showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text('confirm the order?'),
                      actions: [
                        FlatButton(
                          child: Text('Yes'),
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                        ),
                        FlatButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                        )
                      ],
                    ));

                if (isOrderConfirm ?? false) {
                  vm.confirmOrder();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
