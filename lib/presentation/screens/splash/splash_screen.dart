import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/const/named_routes.dart';
import 'package:guia_moteis/infra/theme/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        Navigator.of(context).pushReplacementNamed(NamedRoutes.motels);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SizedBox(
              height: SizeConfig.height(200),
              child: Image.asset('assets/imgs/logo.png')),
        ),
      ),
    );
  }
}
