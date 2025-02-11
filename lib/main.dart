import 'package:flutter/material.dart';
import 'package:guia_moteis/di/injectable.dart';
import 'package:guia_moteis/presentation/app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const AppWidget());
}
