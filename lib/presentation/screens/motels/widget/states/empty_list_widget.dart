import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/theme/theme_constants.dart';
import 'package:guia_moteis/presentation/shared/spacers/parcers.dart';

class EmptyListWidget extends StatelessWidget {
  final void Function() action;
  const EmptyListWidget({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: ThemeConstants.padding,
          vertical: ThemeConstants.doublePadding),
      child: Column(
        children: [
          RichText(
            text: const TextSpan(
              text: 'poxa 🥺',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SpacerVertical.normal(),
          Text(
            'infelizmente não encontramos nenhum motel com reservas disponíveis na sua região.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SpacerVertical.normal(),
          Text(
            'você pode buscar em outras regiões próximas no menu acima',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: action,
            child: Text(
              'voltar',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
