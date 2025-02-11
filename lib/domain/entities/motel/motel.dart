import 'package:guia_moteis/domain/entities/motel/suite.dart';

class Motel {
  final String name;
  final String logo;
  final String neighborhood;
  final double distance;
  final int favoriteAmount;
  final int numberReviews;
  final double avarage;
  final List<Suite> suites;
  bool? isFavorite = false;

  Motel({
    required this.numberReviews,
    required this.avarage,
    required this.name,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.favoriteAmount,
    required this.suites,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite!;
  }
}
