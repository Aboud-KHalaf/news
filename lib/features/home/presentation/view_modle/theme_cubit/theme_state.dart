part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeDark extends ThemeState {
  final ThemeData theme = lightTheme;
}

class ThemeLight extends ThemeState {
  final ThemeData theme = darkTheme;
}
