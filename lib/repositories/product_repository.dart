import 'dart:math';

import 'package:analytics_playground/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
}

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getAllProducts() {
    final products = <Product>[
      Product(1, '扇風機', 8000, '暑い夏を涼しく'),
      Product(2, 'イヤホン', 10000, '最高峰のノイズキャンセリング性能と高音質を生み出す先進技術'),
      Product(3, 'アルカリ乾電池 ', 800, '単3形 20個入'),
      Product(4, 'ワイン', 800, 'オレンジフレーバーを加えた、華やかな香りとすっきりとした味わい'),
    ];

    final rnd = Random().nextInt(3) + 1;

    // fake delay
    return Future.delayed(Duration(milliseconds: 500))
        .then((_) => products.take(rnd).toList());
  }
}
