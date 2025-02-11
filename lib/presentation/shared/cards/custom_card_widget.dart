import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final double? padding;
  const CustomCardWidget({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      padding: EdgeInsets.all(padding ?? ThemeConstants.padding),
      child: child,
    );
  }
}
