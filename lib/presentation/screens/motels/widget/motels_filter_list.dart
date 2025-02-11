import 'package:flutter/material.dart';
import 'package:guia_moteis/di/injectable.dart';
import 'package:guia_moteis/infra/theme/size_config.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/screens/motels/controller/motel_controller.dart';
import 'package:guia_moteis/presentation/shared/buttons/button_filter_widget.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class MotelsFilterList extends StatelessWidget {
  const MotelsFilterList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = getIt<MotelController>();

    return Container(
      padding: const EdgeInsets.only(
        left: ThemeConstants.doublePadding,
        top: ThemeConstants.halfPadding,
        bottom: ThemeConstants.halfPadding,
      ),
      height: SizeConfig.height(50),
      width: SizeConfig.screenWidth,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SpacerHorizontal.half(),
        itemCount: controller.filterItensList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return ButtonFilterWidget(
            filter: controller.filterItensList[i],
          );
        },
      ),
    );
  }
}
