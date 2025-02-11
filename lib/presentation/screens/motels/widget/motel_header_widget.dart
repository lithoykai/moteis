import 'package:flutter/material.dart';
import 'package:guia_moteis/domain/entities/motel/motel.dart';
import 'package:guia_moteis/infra/theme/default_colors.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/shared/cards/avarage_card_widget.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class MotelHeaderWidget extends StatefulWidget {
  const MotelHeaderWidget({
    super.key,
    required this.motel,
  });

  final Motel motel;

  @override
  State<MotelHeaderWidget> createState() => _MotelHeaderWidgetState();
}

class _MotelHeaderWidgetState extends State<MotelHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.motel.logo),
            ),
            const SpacerHorizontal.half(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.motel.name.toLowerCase(),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SpacerVertical.min(),
                Text(
                  widget.motel.neighborhood.toLowerCase(),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SpacerVertical.min(),
                AvarageCardWidget(
                  avarage: widget.motel.avarage,
                  numberReviews: widget.motel.numberReviews,
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () => setState(() {
            widget.motel.toggleFavorite();
          }),
          icon: Icon(
            Icons.favorite,
            color: widget.motel.isFavorite!
                ? AppColors.errorColor
                : AppColors.iconColor.withOpacity(0.7),
            size: ThemeConstants.iconSize,
          ),
        ),
      ],
    );
  }
}
