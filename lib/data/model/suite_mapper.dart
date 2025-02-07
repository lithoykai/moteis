import 'package:guia_moteis/data/model/suite_model.dart';
import 'package:guia_moteis/domain/entities/motel/suite.dart';

SuiteModel $SuiteModelFromEntity(Suite entity) {
  return SuiteModel(
    nameModel: entity.name,
    quantityModel: entity.quantity,
    hasAvailableModel: entity.hasAvailable,
    photosModel: entity.photos,
    itensModel: entity.itens.map((e) => ItemModel.fromEntity(e)).toList(),
    categoryItensModel:
        entity.categoryItens.map((e) => CategoryModel.fromEntity(e)).toList(),
    periodsModel: entity.periods.map((e) => PeriodModel.fromEntity(e)).toList(),
  );
}

Suite $SuiteModelToEntity(SuiteModel model) {
  return Suite(
    name: model.nameModel,
    quantity: model.quantityModel,
    hasAvailable: model.hasAvailableModel,
    photos: model.photosModel,
    itens: model.itensModel.map((e) => e.toEntity()).toList(),
    categoryItens: model.categoryItensModel.map((e) => e.toEntity()).toList(),
    periods: model.periodsModel.map((e) => e.toEntity()).toList(),
  );
}

ItemModel $ItemModelFromEntity(Item entity) {
  return ItemModel(nameModel: entity.name);
}

Item $ItemModelToEntity(ItemModel model) {
  return Item(name: model.nameModel);
}

CategoryModel $CategoryModelFromEntity(Category entity) {
  return CategoryModel(nameModel: entity.name, iconModel: entity.icon);
}

Category $CategoryModelToEntity(CategoryModel model) {
  return Category(name: model.nameModel, icon: model.iconModel);
}

PeriodModel $PeriodModelFromEntity(Period entity) {
  return PeriodModel(
    normalizedTimeModel: entity.normalizedTime,
    timeModel: entity.time,
    priceModel: entity.price,
    totalPriceModel: entity.totalPrice,
    hasCourtesyModel: entity.hasCourtesy,
    promotionModel: entity.promotion != null
        ? PromotionModel.fromEntity(entity.promotion!)
        : null,
  );
}

Period $PeriodModelToEntity(PeriodModel model) {
  return Period(
    normalizedTime: model.normalizedTimeModel,
    time: model.timeModel,
    price: model.priceModel,
    totalPrice: model.totalPriceModel,
    hasCourtesy: model.hasCourtesyModel,
    promotion: model.promotionModel?.toEntity(),
  );
}

PromotionModel $PromotionModelFromEntity(Promotion entity) {
  return PromotionModel(promotionModel: entity.promotion);
}

Promotion $PromotionModelToEntity(PromotionModel model) {
  return Promotion(promotion: model.promotionModel);
}
