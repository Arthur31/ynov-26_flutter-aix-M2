import 'package:aix_1/TP-2_navigation/pages/detail/detail_page.dart';
import 'package:aix_1/TP-2_navigation/pages/home/home_page.dart';
import 'package:aix_1/TP-2_navigation/models/product.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => HomePage()),
    GoRoute(
      path: "/detail",
      builder: (context, state) => DetailPage(product: state.extra as Product),
    ),
  ],
);
