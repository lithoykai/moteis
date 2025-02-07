import 'package:guia_moteis/data/model/motel_mapper.dart';
import 'package:guia_moteis/domain/entities/motel/motel.dart';
import 'package:guia_moteis/data/model/suite_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'motel_model.g.dart';

@JsonSerializable(anyMap: true)
class MotelModel extends Motel {
  @JsonKey(name: 'fantasia')
  final String fantasiaModel;
  @JsonKey(name: 'logo')
  final String logoModel;
  @JsonKey(name: 'bairro')
  final String bairroModel;
  @JsonKey(name: 'distancia')
  final double distanciaModel;
  @JsonKey(name: 'qtdFavoritos')
  final int qtdFavoritosModel;
  @JsonKey(name: 'suites')
  final List<SuiteModel> suitesModel;

  MotelModel({
    required this.fantasiaModel,
    required this.logoModel,
    required this.bairroModel,
    required this.distanciaModel,
    required this.qtdFavoritosModel,
    required this.suitesModel,
  }) : super(
          fantasia: fantasiaModel,
          logo: logoModel,
          bairro: bairroModel,
          distancia: distanciaModel,
          qtdFavoritos: qtdFavoritosModel,
          suites: suitesModel,
        );

  factory MotelModel.fromJson(Map<String, dynamic> json) =>
      _$MotelModelFromJson(json);

  Map<String, dynamic> toJson() => _$MotelModelToJson(this);

  factory MotelModel.fromEntity(Motel entity) => $MotelModelFromEntity(entity);

  Motel toEntity() => $MotelModelToEntity(this);
}
