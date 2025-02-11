import 'package:flutter/material.dart';
import 'package:guia_moteis/domain/entities/motel/motel.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/screens/motels/widget/motel_header_widget.dart';

import 'package:guia_moteis/presentation/screens/motels/widget/suite/suite_content_widget.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class MotelCardWidget extends StatelessWidget {
  final Motel motel;

  const MotelCardWidget({
    super.key,
    required this.motel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeConstants.doublePadding,
        vertical: ThemeConstants.halfPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MotelHeaderWidget(motel: motel),
          const SpacerVertical.half(),
          // não é performático em grandes volumes
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: motel.suites.map((suite) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SuiteContentWidget(suite: suite),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
