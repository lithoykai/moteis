import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/theme/size_config.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        width: SizeConfig.width(120),
        height: SizeConfig.height(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              const AssetImage('assets/imgs/icon_flash.png'),
              color: Theme.of(context).primaryColor,
            ),
            Text(
              'ir agora',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
