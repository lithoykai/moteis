import 'package:guia_moteis/data/model/suite_mapper.dart';
import 'package:guia_moteis/domain/entities/motel/suite.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suite_model.g.dart';

@JsonSerializable(anyMap: true)
class SuiteModel extends Suite {
  @JsonKey(name: 'nome')
  final String nameModel;
  @JsonKey(name: 'qtd')
  final int quantityModel;
  @JsonKey(name: 'exibirQtdDisponiveis')
  final bool hasAvailableModel;
  @JsonKey(name: 'fotos')
  final List<String> photosModel;
  @JsonKey(name: 'itens')
  final List<ItemModel> itensModel;
  @JsonKey(name: 'categoriaItens')
  final List<CategoryModel> categoryItensModel;
  @JsonKey(name: 'periodos')
  final List<PeriodModel> periodsModel;

  SuiteModel(
      {required this.nameModel,
      required this.quantityModel,
      required this.hasAvailableModel,
      required this.photosModel,
      required this.itensModel,
      required this.categoryItensModel,
      required this.periodsModel})
      : super(
          name: nameModel,
          quantity: quantityModel,
          hasAvailable: hasAvailableModel,
          photos: photosModel,
          itens: itensModel,
          categoryItens: categoryItensModel,
          periods: periodsModel,
        );

  factory SuiteModel.fromJson(Map json) => _$SuiteModelFromJson(json);
  Map<String, dynamic> toJson() => _$SuiteModelToJson(this);
  factory SuiteModel.fromEntity(Suite entity) => $SuiteModelFromEntity(entity);
  Suite toEntity() => $SuiteModelToEntity(this);
}

@JsonSerializable(anyMap: true)
class ItemModel extends Item {
  @JsonKey(name: 'nome')
  final String nameModel;

  ItemModel({required this.nameModel}) : super(name: nameModel);

  factory ItemModel.fromJson(Map json) => _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
  factory ItemModel.fromEntity(Item entity) => $ItemModelFromEntity(entity);
  Item toEntity() => $ItemModelToEntity(this);
}

@JsonSerializable(anyMap: true)
class CategoryModel extends Category {
  @JsonKey(name: 'nome')
  final String nameModel;

  @JsonKey(name: 'icone')
  final String iconModel;

  CategoryModel({
    required this.nameModel,
    required this.iconModel,
  }) : super(name: nameModel, icon: iconModel);

  factory CategoryModel.fromJson(Map json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
  factory CategoryModel.fromEntity(Category entity) =>
      $CategoryModelFromEntity(entity);
  Category toEntity() => $CategoryModelToEntity(this);
}

@JsonSerializable(anyMap: true)
class PeriodModel extends Period {
  @JsonKey(name: 'tempoFormatado')
  final String normalizedTimeModel;
  @JsonKey(name: 'tempo')
  final String timeModel;
  @JsonKey(name: 'valor')
  final double priceModel;
  @JsonKey(name: 'valorTotal')
  final double totalPriceModel;
  @JsonKey(name: 'temCortesia')
  final bool hasCourtesyModel;
  @JsonKey(name: 'desconto')
  final PromotionModel? promotionModel;

  PeriodModel({
    required this.normalizedTimeModel,
    required this.timeModel,
    required this.priceModel,
    required this.totalPriceModel,
    required this.hasCourtesyModel,
    required this.promotionModel,
  }) : super(
          normalizedTime: normalizedTimeModel,
          time: timeModel,
          price: priceModel,
          totalPrice: totalPriceModel,
          hasCourtesy: hasCourtesyModel,
          promotion: promotionModel,
        );

  factory PeriodModel.fromJson(Map json) => _$PeriodModelFromJson(json);
  Map<String, dynamic> toJson() => _$PeriodModelToJson(this);
  factory PeriodModel.fromEntity(Period entity) =>
      $PeriodModelFromEntity(entity);
  Period toEntity() => $PeriodModelToEntity(this);
}

@JsonSerializable(anyMap: true)
class PromotionModel extends Promotion {
  @JsonKey(name: 'desconto')
  final double promotionModel;

  PromotionModel({
    required this.promotionModel,
  }) : super(promotion: promotionModel);

  factory PromotionModel.fromJson(Map json) => _$PromotionModelFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionModelToJson(this);
  factory PromotionModel.fromEntity(Promotion entity) =>
      $PromotionModelFromEntity(entity);
  Promotion toEntity() => $PromotionModelToEntity(this);
}
