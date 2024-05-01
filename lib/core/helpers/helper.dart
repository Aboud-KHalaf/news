import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/services/news_services.dart';
import 'package:news/core/widgets/bottom_nav_bar.dart';
import 'package:news/features/descover/data/repos/descover_repo_impl.dart';
import 'package:news/features/descover/presentation/view/discover_view.dart';
import 'package:news/features/descover/presentation/view_model/descover_cubit/descover_cubit.dart';
import 'package:news/features/descover/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:news/features/home/data/repos/home_repos_imple.dart';
import 'package:news/features/home/presentation/view_modle/home_cubit/home_cubit.dart';
import 'package:news/features/home/presentation/view_modle/theme_cubit/theme_cubit.dart';
import 'package:news/features/home/presentation/views/article_view.dart';
import 'package:news/features/home/presentation/views/home_view.dart';
import 'package:news/features/descover/presentation/view/search_view.dart';
import 'package:provider/single_child_widget.dart';

const String erroreImageUrl = 'assets/sp.png';

String imageURL(String url) {
  try {
    return url;
  } catch (e) {
    return erroreImageUrl;
  }
}

List<String> tabs = [
  'business',
  'entertainment',
  'general',
  'health',
  'science',
  'technology',
  'sports',
];

List<SingleChildWidget> providers = [
  BlocProvider(
    create: (context) => HomeCubit(HomeRepoImpl(ApiServices(Dio())))
      ..fetchBreakingNews(country: 'us'),
  ),
  BlocProvider(
    create: (context) => DescoverCubit(DescoverRepoImple(ApiServices(Dio()))),
  ),
  BlocProvider(
    create: (context) => SearchCubit(DescoverRepoImple(ApiServices(Dio()))),
  ),
  BlocProvider(
    create: (context) => ThemeCubit()..getAppTheme(),
  ),
];

Map<String, Widget Function(BuildContext)> routs = {
  HomeView.routeName: (context) => const HomeView(),
  ArticleView.routeName: (context) => const ArticleView(),
  DiscoverView.routeName: (context) => const DiscoverView(),
  BottomNavBar.routeName: (context) => const BottomNavBar(),
  SearchPage.routeName: (context) => const SearchPage(),
};
