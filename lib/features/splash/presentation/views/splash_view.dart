import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/core/widgets/bottom_nav_bar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static String routeName = 'splash page';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 130, end: 200).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacementNamed(context, BottomNavBar.routeName);
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/sp.png',
                width: _animation.value, // Use the animated value
              ),
            ),
          ),
        ],
      ),
    );
  }
}
