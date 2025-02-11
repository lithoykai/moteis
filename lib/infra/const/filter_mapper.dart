List<FilterItens> filterItens = [
  FilterItens(name: 'filtros', isSelected: false),
  FilterItens(name: 'com desconto', isSelected: false),
  FilterItens(name: 'disponíveis', isSelected: false),
  FilterItens(name: 'hidro', isSelected: false),
  FilterItens(name: 'piscina', isSelected: false),
  FilterItens(name: 'sauna', isSelected: false),
  FilterItens(name: 'ofurô', isSelected: false),
  FilterItens(name: 'decoração erótica', isSelected: false),
  FilterItens(name: 'decoração temática', isSelected: false),
  FilterItens(name: 'cadeira erótica', isSelected: false),
  FilterItens(name: 'pista de dança', isSelected: false),
  FilterItens(name: 'garagem privativa', isSelected: false),
  FilterItens(name: 'frigobar', isSelected: false),
  FilterItens(name: 'internet wi-fi', isSelected: false),
  FilterItens(name: 'suíte para festas', isSelected: false),
  FilterItens(name: 'suíte com acessibilidade', isSelected: false),
];

class FilterItens {
  final String name;
  bool isSelected;

  FilterItens({required this.name, this.isSelected = false});

  void toggleStatus() {
    isSelected = !isSelected;
  }
}
