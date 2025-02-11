import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/theme/default_colors.dart';
import 'package:guia_moteis/infra/theme/size_config.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/shared/cards/custom_card_widget.dart';

class AvailabilityCardWidget extends StatelessWidget {
  const AvailabilityCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
        padding: ThemeConstants.padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'indisponível no app',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.notAvailabilityColor,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.fontSize(16),
                  ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: ThemeConstants.halfPadding,
                  vertical: ThemeConstants.halfPadding,
                ),
                backgroundColor: AppColors.notAvailabilityColor,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(ThemeConstants.borderRadius / 2),
                ),
              ),
              label: Text(
                'avise-me',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              icon: Icon(
                Icons.notifications_none_rounded,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            )
          ],
        ));
  }
}
