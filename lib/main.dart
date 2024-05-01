import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helpers/helper.dart';
import 'package:news/core/themes/light_theme.dart';
import 'package:news/features/home/presentation/view_modle/theme_cubit/theme_cubit.dart';
import 'package:news/features/splash/presentation/views/splash_view.dart';

import 'package:news/core/themes/dark_theme.dart';

void main() {
  runApp(
    const NewsApp(),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: (state is ThemeDark) ? darkTheme : lightTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashPage(),
            routes: routs,
            initialRoute: SplashPage.routeName,
          );
        },
      ),
    );
  }
}