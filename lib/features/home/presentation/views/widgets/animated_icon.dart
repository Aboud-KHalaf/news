import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/enums/app_theme_enum.dart';
import 'package:news/features/home/presentation/view_modle/theme_cubit/theme_cubit.dart';

class CustomAnimatedIcon extends StatefulWidget {
  const CustomAnimatedIcon({super.key});

  @override
  State<CustomAnimatedIcon> createState() => _CustomAnimatedIconState();
}

class _CustomAnimatedIconState extends State<CustomAnimatedIcon> {
  @override
  Widget build(BuildContext context) {
    int themeIdx = context.read<ThemeCubit>().getThemeIndex();

    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return RotationTransition(
            turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.5),
              borderRadius: BorderRadius.circular(8)),
          child: Icon(
            AppTheme.values[themeIdx].icon,
            key: ValueKey(themeIdx),
          ),
        ),
      ),
      onPressed: () async {
        setState(() {});
        context.read<ThemeCubit>().changeTheme();
      },
    );
  }
}
