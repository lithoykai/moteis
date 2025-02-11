import 'package:flutter/material.dart';
import 'package:guia_moteis/domain/entities/motel/suite.dart';
import 'package:guia_moteis/infra/theme/size_config.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/screens/motels/image_gallery_suite_screen.dart';
import 'package:guia_moteis/presentation/screens/motels/itens_suite_screen.dart';
import 'package:guia_moteis/presentation/screens/motels/widget/suite/availability_card_widget.dart';
import 'package:guia_moteis/presentation/screens/motels/widget/suite/image_suite_widget.dart';
import 'package:guia_moteis/presentation/screens/motels/widget/suite/itens_card_widget.dart';
import 'package:guia_moteis/presentation/screens/motels/widget/suite/price_card_widget.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class SuiteContentWidget extends StatelessWidget {
  final Suite suite;

  const SuiteContentWidget({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width(320),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ImageGallerySuiteScreen(
                        images: suite.photos,
                        suiteName: suite.name,
                      ))),
              child: ImageSuiteWidget(suite: suite)),
          const SpacerVertical.half(),
          if (!suite.hasAvailable) ...[
            const AvailabilityCardWidget(),
            const SpacerVertical.half(),
          ],
          GestureDetector(
              onTap: () {
                showBottomSheet(
                    context: context,
                    builder: (ctx) => SuiteItensScreen(
                          suite: suite,
                        ));
              },
              child: ItensCardWidget(itens: suite.categoryItens)),
          const SpacerVertical.half(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: suite.periods
                .map(
                  (period) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: ThemeConstants.minPadding,
                    ),
                    child: PriceCardWidget(
                      period: period,
                      hasDispnibility: suite.hasAvailable,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
