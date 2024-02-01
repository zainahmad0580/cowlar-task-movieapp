import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/provider/genre_provider.dart';
import 'package:movieapp/routes/route_names.dart';
import 'package:movieapp/utils/app_assets.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      //To set genres before going inside app
      Provider.of<GenreProvider>(context, listen: false).setGenres();
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.home, (route) => false);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: ScaleTransition(
                scale: _animation,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: size.width * 0.3,
                        height: size.width * 0.3,
                        child: Image.asset(AppAssets.logo))))));
  }
}
