import 'package:flutter/material.dart';
import 'package:guia_moteis/domain/entities/motel/suite.dart';
import 'package:guia_moteis/infra/theme/default_colors.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/shared/cards/custom_card_widget.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class ItensCardWidget extends StatelessWidget {
  final List<Category> itens;
  const ItensCardWidget({super.key, required this.itens});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var item in itens.take(4))
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: ThemeConstants.minPadding),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ThemeConstants.borderRadius),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: ImageIcon(
                  NetworkImage(item.icon),
                  size: ThemeConstants.iconSize * 2,
                  color: AppColors.iconColor,
                ),
              ),
            ),
          Row(
            children: [
              const SpacerHorizontal.normal(),
              Text(
                'ver\ntodos',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.iconColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.iconColor,
                size: ThemeConstants.iconSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
