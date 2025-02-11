import 'package:flutter/material.dart';
import 'package:guia_moteis/domain/entities/motel/suite.dart';
// import 'package:guia_moteis/infra/theme/size_config.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/shared/cards/custom_card_widget.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class ImageSuiteWidget extends StatelessWidget {
  final Suite suite;
  const ImageSuiteWidget({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      padding: ThemeConstants.halfPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
            ),
            child: Image.network(
              suite.photos.first,
              fit: BoxFit.cover,
            ),
          ),
          const SpacerVertical.normal(),
          Text(
            suite.name.length > 20
                ? '${suite.name.toLowerCase().substring(0, 20)}...'
                : suite.name.toLowerCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SpacerVertical.normal(),
        ],
      ),
    );
  }
}
