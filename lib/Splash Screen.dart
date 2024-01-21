import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'CountryStatesScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  );

  late final Animation<double> _rotationAnimation = Tween<double>(
    begin: 0.0,
    end: 2.0 * math.pi,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutQuad,
  ));

  late final Animation<double> _scaleAnimation = Tween<double>(
    begin: 1.0,
    end: 1.5,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutQuad,
  ));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.repeat(reverse: true);
    Timer(const Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const CountryStatesScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,

                ),
                child: const Center(
                  child: Image(image: AssetImage('Assets/country.png')),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: child!,
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Country Explorer App',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            )
          ],
        ),
      ),
    );
  }
}
