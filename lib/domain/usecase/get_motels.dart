import 'package:dartz/dartz.dart';
import 'package:guia_moteis/domain/entities/motel/motel.dart';
import 'package:guia_moteis/domain/entities/response/response_list.dart';
import 'package:guia_moteis/domain/repository/motel_repository.dart';
import 'package:guia_moteis/infra/failure/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMotelsUseCase {
  MotelRepository _repository;

  GetMotelsUseCase({required MotelRepository repository})
      : _repository = repository;

  Future<Either<Failure, ResponseList<Motel>>> call() async {
    return _repository.getMotels();
  }
}
