import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/category_descover_news.dart';
import 'widgets/descover_news.dart';
import '../../../../core/helpers/helper.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  static String routeName = '/discoverPage';

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colorScheme.background,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: DescoverNews()),
              SliverToBoxAdapter(
                child: CategoryNews(
                  tabs: tabs,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
