import 'package:flutter/material.dart';
import 'package:guia_moteis/domain/entities/motel/suite.dart';
import 'package:guia_moteis/infra/theme/default_colors.dart';
import 'package:guia_moteis/infra/theme/size_config.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class SuiteItensScreen extends StatelessWidget {
  final Suite suite;
  const SuiteItensScreen({
    super.key,
    required this.suite,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(ThemeConstants.padding),
        color: Theme.of(context).colorScheme.secondary,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SpacerVertical.double(),
                Text(
                  suite.name.toLowerCase(),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColors.textColor,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SpacerVertical.double(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.black,
                      height: 1,
                      width: SizeConfig.screenWidth * 0.2,
                    ),
                    Text(
                      ' principais itens ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.fontSize(22),
                          ),
                    ),
                    Container(
                      color: Colors.black,
                      height: 1,
                      width: SizeConfig.screenWidth * 0.2,
                    ),
                  ],
                ),
                const SpacerVertical.double(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var item in suite.categoryItens.take(2))
                      Row(
                        children: [
                          ImageIcon(
                            NetworkImage(item.icon),
                            size: ThemeConstants.iconSize * 2,
                            color: AppColors.iconColor,
                          ),
                          Text(
                            item.name.toLowerCase(),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: SizeConfig.fontSize(14),
                                    ),
                          ),
                        ],
                      ),
                  ],
                ),
                if (suite.categoryItens.length >= 4)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var item in suite.categoryItens.skip(2).take(2))
                        Row(
                          children: [
                            ImageIcon(
                              NetworkImage(item.icon),
                              size: ThemeConstants.iconSize * 2,
                              color: AppColors.iconColor,
                            ),
                            Text(
                              item.name.toLowerCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: SizeConfig.fontSize(14),
                                  ),
                            ),
                          ],
                        ),
                    ],
                  ),
                const SpacerVertical.double(),
                if (suite.itens.isNotEmpty)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            color: Colors.black,
                            height: 1,
                            width: SizeConfig.screenWidth * 0.2,
                          ),
                          Text(
                            ' tem também ',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.fontSize(22),
                                    ),
                          ),
                          Container(
                            color: Colors.black,
                            height: 1,
                            width: SizeConfig.screenWidth * 0.2,
                          ),
                        ],
                      ),
                      const SpacerVertical.double(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: ThemeConstants.padding),
                        child: Text(
                          suite.itens.isNotEmpty
                              ? suite.itens.map((item) => item.name).join(", ")
                              : "Nenhum item disponível",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: SizeConfig.fontSize(16),
                                  ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ThemeConstants.doublePadding * 2,
                    horizontal: ThemeConstants.halfPadding),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: ThemeConstants.iconSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
