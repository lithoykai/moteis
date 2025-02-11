import 'package:guia_moteis/data/model/motel_mapper.dart';
import 'package:guia_moteis/domain/entities/motel/motel.dart';
import 'package:guia_moteis/data/model/suite_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'motel_model.g.dart';

@JsonSerializable(anyMap: true)
class MotelModel extends Motel {
  @JsonKey(name: 'fantasia')
  final String nameModel;
  @JsonKey(name: 'logo')
  final String logoModel;
  @JsonKey(name: 'bairro')
  final String neighborhoodModel;
  @JsonKey(name: 'distancia')
  final double distanceModel;
  @JsonKey(name: 'qtdFavoritos')
  final int favoriteAmountModel;
  @JsonKey(name: 'suites')
  final List<SuiteModel> suitesModel;
  @JsonKey(name: 'qtdAvaliacoes')
  final int numberReviewsModel;
  @JsonKey(name: 'media')
  final double avarageModel;

  MotelModel({
    required this.nameModel,
    required this.logoModel,
    required this.neighborhoodModel,
    required this.distanceModel,
    required this.favoriteAmountModel,
    required this.suitesModel,
    required this.numberReviewsModel,
    required this.avarageModel,
  }) : super(
          name: nameModel,
          logo: logoModel,
          neighborhood: neighborhoodModel,
          distance: distanceModel,
          favoriteAmount: favoriteAmountModel,
          suites: suitesModel,
          avarage: avarageModel,
          numberReviews: numberReviewsModel,
        );

  factory MotelModel.fromJson(Map<String, dynamic> json) =>
      _$MotelModelFromJson(json);

  Map<String, dynamic> toJson() => _$MotelModelToJson(this);

  factory MotelModel.fromEntity(Motel entity) => $MotelModelFromEntity(entity);

  Motel toEntity() => $MotelModelToEntity(this);
}
