import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';

class SpacerVertical extends SizedBox {
  const SpacerVertical.half({super.key})
      : super(height: ThemeConstants.halfPadding);
  const SpacerVertical.min({super.key})
      : super(height: ThemeConstants.minPadding);
  const SpacerVertical.normal({super.key})
      : super(height: ThemeConstants.padding);
  const SpacerVertical.double({super.key})
      : super(height: ThemeConstants.doublePadding);
}

class SpacerHorizontal extends SizedBox {
  const SpacerHorizontal.half({super.key})
      : super(width: ThemeConstants.halfPadding);
  const SpacerHorizontal.normal({super.key})
      : super(width: ThemeConstants.padding);
  const SpacerHorizontal.double({super.key})
      : super(width: ThemeConstants.doublePadding);
}
