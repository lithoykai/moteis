import 'package:flutter/material.dart';
import 'package:guia_moteis/di/injectable.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/screens/motels/controller/motel_controller.dart';
import 'package:guia_moteis/presentation/screens/motels/widget/states/empty_list_widget.dart';
import 'package:guia_moteis/presentation/screens/motels/widget/states/loading_state_widget.dart';
import 'package:guia_moteis/presentation/screens/motels/widget/motel_card_widget.dart';
import 'package:guia_moteis/presentation/screens/motels/widget/motels_filter_list.dart';

class MotelsListWidget extends StatefulWidget {
  const MotelsListWidget({super.key});

  @override
  State<MotelsListWidget> createState() => _MotelsListWidgetState();
}

class _MotelsListWidgetState extends State<MotelsListWidget> {
  final controller = getIt<MotelController>();

  @override
  void initState() {
    controller.list();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ThemeConstants.borderRadius * 2),
          topRight: Radius.circular(ThemeConstants.borderRadius * 2),
        ),
      ),
      child: Column(
        children: [
          const MotelsFilterList(),
          Divider(
            color: Theme.of(context).colorScheme.outline,
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: controller,
              builder: (context, child) {
                if (controller.filteredMotels.isEmpty &&
                    controller.state is IdleMotelState) {
                  return EmptyListWidget(action: controller.list);
                }

                if (controller.state is LoadingMotelState) {
                  return const LoadingStateWidget();
                }

                if (controller.state is ErrorMotelState) {
                  final errorMessage =
                      (controller.state as ErrorMotelState).msg;
                  return Center(
                    child: Text(
                      'Erro: $errorMessage',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: controller.filteredMotels.length,
                  itemBuilder: (context, index) {
                    final motel = controller.filteredMotels[index];
                    return MotelCardWidget(motel: motel);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
