import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class AvarageCardWidget extends StatelessWidget {
  final double avarage;
  final int numberReviews;
  const AvarageCardWidget(
      {super.key, required this.avarage, required this.numberReviews});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: ThemeConstants.minPadding),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber),
            borderRadius:
                BorderRadius.circular(ThemeConstants.borderRadius / 1.5),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: ThemeConstants.iconSize / 2,
              ),
              Text(
                avarage.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SpacerHorizontal.half(),
        Text(
          '$numberReviews avaliações',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
