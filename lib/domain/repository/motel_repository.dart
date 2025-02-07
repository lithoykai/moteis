import 'package:guia_moteis/domain/entities/motel/motel.dart';
import 'package:guia_moteis/domain/entities/response/response_list.dart';
import 'package:guia_moteis/infra/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class MotelRepository {
  Future<Either<Failure, ResponseList<Motel>>> getMotels();
}
