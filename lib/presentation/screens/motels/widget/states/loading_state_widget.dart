import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/theme/size_config.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class LoadingStateWidget extends StatefulWidget {
  const LoadingStateWidget({super.key});

  @override
  State<LoadingStateWidget> createState() => _LoadingStateWidgetState();
}

class _LoadingStateWidgetState extends State<LoadingStateWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<Alignment>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: SizeConfig.width(40),
                  height: SizeConfig.height(40),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      AlignTransition(
                        alignment: _animation,
                        child: Container(
                          width: SizeConfig.width(100),
                          height: SizeConfig.height(100),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey[300]!,
                                Colors.grey[350]!,
                                Colors.grey[300]!,
                              ],
                              stops: const [0.2, 0.5, 0.8],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                LoadingContainer(
                  animation: _animation,
                  width: SizeConfig.width(250),
                  height: SizeConfig.height(100),
                ),
              ],
            ),
            const SpacerVertical.half(),
            LoadingContainer(
              animation: _animation,
              width: SizeConfig.width(320),
              height: SizeConfig.height(400),
            ),
            const SpacerVertical.half(),
            LoadingContainer(
              animation: _animation,
              width: SizeConfig.width(320),
              height: SizeConfig.height(100),
            ),
            const SpacerVertical.half(),
            LoadingContainer(
              animation: _animation,
              width: SizeConfig.width(320),
              height: SizeConfig.height(100),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    super.key,
    required Animation<Alignment> animation,
    required this.width,
    required this.height,
  }) : _animation = animation;

  final Animation<Alignment> _animation;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          AlignTransition(
            alignment: _animation,
            child: Container(
              width: 100,
              height: height > 100 ? 400 : 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey[300]!,
                    Colors.grey[350]!,
                    Colors.grey[300]!,
                  ],
                  stops: const [0.2, 0.5, 0.8],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
