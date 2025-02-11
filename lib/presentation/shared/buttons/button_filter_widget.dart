import 'package:flutter/material.dart';
import 'package:guia_moteis/di/injectable.dart';
import 'package:guia_moteis/infra/const/filter_mapper.dart';
import 'package:guia_moteis/infra/theme/size_config.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/screens/motels/controller/motel_controller.dart';

class ButtonFilterWidget extends StatefulWidget {
  final FilterItens filter;

  const ButtonFilterWidget({super.key, required this.filter});

  @override
  State<ButtonFilterWidget> createState() => _ButtonFilterWidgetState();
}

class _ButtonFilterWidgetState extends State<ButtonFilterWidget> {
  final controller = getIt<MotelController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              if (widget.filter.name == 'filtros') {
                return;
              }

              controller.toggleFilter(widget.filter.name);
            },
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeConstants.halfPadding,
                    vertical: ThemeConstants.halfPadding,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outline),
                    color: widget.filter.isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                    borderRadius:
                        BorderRadius.circular(ThemeConstants.borderRadius),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.filter.name == 'filtros')
                        const Icon(Icons.filter_alt_outlined),
                      Text(
                        widget.filter.name,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: widget.filter.isSelected
                                  ? Colors.white
                                  : null,
                            ),
                      ),
                    ],
                  ),
                ),
                if (widget.filter.name == 'filtros')
                  ListenableBuilder(
                    listenable: controller,
                    builder: (ctx, child) {
                      return controller.filterItensList
                              .where((item) => item.isSelected)
                              .isNotEmpty
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: SizeConfig.height(15),
                                width: SizeConfig.width(15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: widget.filter.isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  controller.filterItensList
                                      .where((item) => item.isSelected)
                                      .length
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: SizeConfig.fontSize(8),
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    },
                  ),
              ],
            ),
          );
        });
  }
}
