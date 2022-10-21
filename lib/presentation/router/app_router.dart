import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:random_cat_facts/presentation/views/fact/fact_view.dart';
import 'package:random_cat_facts/presentation/views/history/fact_history_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View',
  routes: <AutoRoute>[
    AutoRoute(page: FactView, initial: true),
    AutoRoute(page: FactHistoryView),
  ],
)
class AppRouter extends _$AppRouter {}
