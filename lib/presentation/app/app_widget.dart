import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/theme/default_theme.dart';
import 'package:guia_moteis/infra/theme/size_config.dart';
import 'package:guia_moteis/presentation/app/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
      title: 'Guia de Motéis',
      theme: CustomThemes.defaultTheme,
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
    );
  }
}
