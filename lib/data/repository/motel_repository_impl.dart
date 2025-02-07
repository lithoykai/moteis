import 'package:dartz/dartz.dart';
import 'package:guia_moteis/data/datasource/motels_remote_datasource.dart';
import 'package:guia_moteis/domain/entities/motel/motel.dart';
import 'package:guia_moteis/domain/entities/response/response_list.dart';
import 'package:guia_moteis/domain/repository/motel_repository.dart';
import 'package:guia_moteis/infra/failure/failure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MotelRepository)
class MotelRepositoryImpl implements MotelRepository {
  final MotelsRemoteDatasource _datasource;

  MotelRepositoryImpl({required MotelsRemoteDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<Failure, ResponseList<Motel>>> getMotels() async {
    try {
      final _response = await _datasource.getMotels();
      return right(_response);
    } catch (e) {
      return left(ServerFailure(msg: e.toString()));
    }
  }
}
