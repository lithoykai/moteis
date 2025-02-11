import 'package:flutter/material.dart';
import 'package:guia_moteis/domain/entities/motel/suite.dart';
import 'package:guia_moteis/infra/theme/default_colors.dart';
import 'package:guia_moteis/infra/theme/size_config.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/shared/cards/custom_card_widget.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class PriceCardWidget extends StatelessWidget {
  final Period period;
  final bool hasDispnibility;

  const PriceCardWidget({
    super.key,
    required this.period,
    required this.hasDispnibility,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    bool isBefore10PM = now.hour < 22;
    bool isOvernight = period.time == '12';
    bool isOvernightBlocked = isOvernight && isBefore10PM;
    bool isDisabled = isOvernightBlocked || !hasDispnibility;
    bool hasPromotion =
        period.promotion != null && period.promotion!.promotion > 0;

    return CustomCardWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    isOvernight ? 'Pernoite' : '${period.time} horas',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: isDisabled ? AppColors.disableTextColor : null,
                        ),
                  ),
                  const SpacerHorizontal.normal(),
                  if (hasPromotion && hasDispnibility && !isOvernightBlocked)
                    PorcentagePromotion(
                        porcentage: period.promotion!.promotion.toString()),
                ],
              ),
              Row(
                children: [
                  if (hasPromotion)
                    Padding(
                      padding: const EdgeInsets.only(
                          right: ThemeConstants.halfPadding),
                      child: Text(
                        'R\$ ${period.price.toString()}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor:
                                  AppColors.disableTextColor.withAlpha(150),
                              color: AppColors.disableTextColor.withAlpha(150),
                            ),
                      ),
                    ),
                  Text(
                    'R\$ ${period.totalPrice.toString()}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: isDisabled ? AppColors.disableTextColor : null,
                        ),
                  ),
                ],
              ),
              if (isOvernightBlocked)
                const Text(
                  'Liberado para reservas a partir das 22h',
                  style: TextStyle(color: AppColors.disableTextColor),
                ),
            ],
          ),
          if (!isOvernightBlocked)
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.disableTextColor,
            ),
        ],
      ),
    );
  }
}

class PorcentagePromotion extends StatelessWidget {
  final String porcentage;
  const PorcentagePromotion({super.key, required this.porcentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: ThemeConstants.minPadding / 2,
          horizontal: ThemeConstants.halfPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.greenAccent.shade700,
        ),
        borderRadius: BorderRadius.circular(ThemeConstants.borderRadius * 2),
      ),
      child: Text(
        '$porcentage% off',
        style: TextStyle(
          color: Colors.greenAccent.shade700,
          fontSize: SizeConfig.fontSize(10),
        ),
      ),
    );
  }
}
