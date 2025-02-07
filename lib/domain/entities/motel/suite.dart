class Item {
  final String name;

  Item({required this.name});
}

class Category {
  final String name;
  final String icon;

  Category({required this.name, required this.icon});
}

class Period {
  final String normalizedTime;
  final String time;
  final double price;
  final double totalPrice;
  final bool hasCourtesy;
  final Promotion? promotion;

  Period(
      {required this.normalizedTime,
      required this.time,
      required this.price,
      required this.totalPrice,
      required this.hasCourtesy,
      required this.promotion});
}

class Promotion {
  final double promotion;

  Promotion({required this.promotion});

  toEntity() {}
}

class Suite {
  final String name;
  final int quantity;
  final bool hasAvailable;
  final List<String> photos;
  final List<Item> itens;
  final List<Category> categoryItens;
  final List<Period> periods;

  Suite({
    required this.name,
    required this.quantity,
    required this.hasAvailable,
    required this.photos,
    required this.itens,
    required this.categoryItens,
    required this.periods,
  });
}
