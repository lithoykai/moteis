import 'package:guia_moteis/data/model/motel_model.dart';
import 'package:guia_moteis/data/model/suite_model.dart';
import 'package:guia_moteis/domain/entities/motel/motel.dart';

MotelModel $MotelModelFromEntity(Motel entity) {
  return MotelModel(
    fantasiaModel: entity.fantasia,
    logoModel: entity.logo,
    bairroModel: entity.bairro,
    distanciaModel: entity.distancia,
    qtdFavoritosModel: entity.qtdFavoritos,
    suitesModel: entity.suites.map((e) => SuiteModel.fromEntity(e)).toList(),
  );
}

Motel $MotelModelToEntity(MotelModel model) {
  return Motel(
    fantasia: model.fantasiaModel,
    logo: model.logoModel,
    bairro: model.bairroModel,
    distancia: model.distanciaModel,
    qtdFavoritos: model.qtdFavoritosModel,
    suites: model.suitesModel.map((e) => e.toEntity()).toList(),
  );
}
