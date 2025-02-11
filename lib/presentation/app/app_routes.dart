import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/const/named_routes.dart';
import 'package:guia_moteis/presentation/screens/motels/motels_screen.dart';
import 'package:guia_moteis/presentation/screens/splash/splash_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  NamedRoutes.splash: (context) => const SplashScreen(),
  NamedRoutes.motels: (context) => const MotelsScreen()
};
