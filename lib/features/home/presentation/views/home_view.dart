// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/enums/app_theme_enum.dart';
import 'package:news/core/helpers/theme_cache_helper.dart';
import 'package:news/features/home/data/models/news_model/news_model.dart';
import 'package:news/features/home/presentation/view_modle/home_cubit/home_cubit.dart';
import 'package:news/features/home/presentation/view_modle/theme_cubit/theme_cubit.dart';
import 'package:news/features/home/presentation/views/widgets/animated_icon.dart';

import 'widgets/breaking_news.dart';
import '../../../../core/widgets/failure_widget.dart';
import 'widgets/news_of_the_day.dart';
import '../../../../core/widgets/loading_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static String routeName = '/homeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;

    return RefreshIndicator(
      color: colorScheme.tertiary,
      onRefresh: () async {
        await BlocProvider.of<HomeCubit>(context)
            .fetchBreakingNews(country: 'us');
      },
      child: Scaffold(
        appBar: AppBar(
          title: const CustomAnimatedIcon(),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: colorScheme.background,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeFailure) {
              return const FailureWidget();
            } else if (state is HomeSuccess) {
              List<NewsModel> articlesList = state.news;
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  NewsOfTheDay(articles: articlesList),
                  BreakingNews(size: size, news: articlesList),
                ],
              );
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
