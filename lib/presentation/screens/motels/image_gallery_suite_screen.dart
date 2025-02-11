import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/theme/default_colors.dart';
import 'package:guia_moteis/infra/theme/size_config.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class ImageGallerySuiteScreen extends StatelessWidget {
  final List<String> images;
  final String suiteName;
  const ImageGallerySuiteScreen(
      {super.key, required this.images, required this.suiteName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          suiteName.toLowerCase(),
          style: const TextStyle(
            color: AppColors.textColor,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.textColor,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(
            images.first,
          ),
          const SpacerVertical.half(),
          Wrap(
            runSpacing: 8,
            children: [
              for (var image in images.skip(1))
                Container(
                  width: SizeConfig.screenWidth / 2,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ]),
      ),
    );
  }
}
