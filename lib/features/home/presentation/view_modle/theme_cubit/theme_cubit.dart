import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news/core/helpers/theme_cache_helper.dart';
import 'package:news/core/themes/dark_theme.dart';
import 'package:news/core/themes/light_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  Future<void> getAppTheme() async {
    int idx = await ThemeCacheHelper().getAppTheme();
    if (idx == 0) {
      emit(ThemeDark());
    } else {
      emit(ThemeLight());
    }
  }

  int getThemeIndex() {
    if (state is ThemeDark) return 0;
    return 1;
  }

  Future<void> changeTheme() async {
    if (state is ThemeDark) {
      ThemeCacheHelper().setNewTheme(1);
    } else {
      ThemeCacheHelper().setNewTheme(0);
    }
    await getAppTheme();
  }
}
