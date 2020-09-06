import 'package:analytics_playground/repositories/product_repository.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class AbstractModule {
  MultiProvider configure({@required Widget Function(BuildContext) builder});
}

class Module implements AbstractModule {
  @override
  MultiProvider configure({@required Widget Function(BuildContext) builder}) {
    assert(builder != null);

    final analytics = Provider<FirebaseAnalytics>(
      create: (_) => FirebaseAnalytics(),
    );

    final productRepository = Provider<ProductRepository>(
      create: (_) => ProductRepositoryImpl(),
    );

    return MultiProvider(
      providers: [
        analytics,
        productRepository,
      ],
      child: Builder(builder: builder),
    );
  }
}
