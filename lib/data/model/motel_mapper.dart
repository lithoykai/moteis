import 'package:guia_moteis/data/model/motel_model.dart';
import 'package:guia_moteis/data/model/suite_model.dart';
import 'package:guia_moteis/domain/entities/motel/motel.dart';

MotelModel $MotelModelFromEntity(Motel entity) {
  return MotelModel(
    nameModel: entity.name,
    logoModel: entity.logo,
    neighborhoodModel: entity.neighborhood,
    distanceModel: entity.distance,
    favoriteAmountModel: entity.favoriteAmount,
    avarageModel: entity.avarage,
    numberReviewsModel: entity.numberReviews,
    suitesModel: entity.suites.map((e) => SuiteModel.fromEntity(e)).toList(),
  );
}

Motel $MotelModelToEntity(MotelModel model) {
  return Motel(
    name: model.nameModel,
    logo: model.logoModel,
    neighborhood: model.neighborhoodModel,
    distance: model.distanceModel,
    favoriteAmount: model.favoriteAmountModel,
    avarage: model.avarageModel,
    numberReviews: model.numberReviewsModel,
    suites: model.suitesModel.map((e) => e.toEntity()).toList(),
  );
}
