import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yandex_map_parking_layer_test/res/assets/assets.gen.dart';
import 'package:yandex_map_parking_layer_test/res/assets/colors.gen.dart';
import 'package:yandex_map_parking_layer_test/router/router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    routeScreen();
  }

  void routeScreen() async {
    Timer(const Duration(seconds: 3),
        () => context.router.replace(const TileRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.parking.image(),
          ],
        ),
      ),
    );
  }
}
