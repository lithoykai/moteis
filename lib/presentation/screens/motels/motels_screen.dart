import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/screens/motels/widget/app_header.dart';
import 'package:guia_moteis/presentation/screens/motels/widget/motels_list_widget.dart';

class MotelsScreen extends StatelessWidget {
  const MotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size(double.infinity, kToolbarHeight),
      //   child: SafeArea(child: AppHeader()),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: ThemeConstants.doublePadding),
              child: AppHeader(),
            ),
            Expanded(child: MotelsListWidget()),
          ],
        ),
      ),
    );
  }
}
