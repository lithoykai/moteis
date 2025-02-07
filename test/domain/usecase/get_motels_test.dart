import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/domain/entities/response/response_list.dart';
import 'package:guia_moteis/domain/repository/motel_repository.dart';

import 'package:guia_moteis/domain/usecase/get_motels.dart';
import 'package:guia_moteis/infra/failure/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixture/fixture.dart';
import 'get_motels_test.mocks.dart';

@GenerateMocks([MotelRepository])
void main() {
  late MotelRepository repository;
  late GetMotelsUseCase useCase;

  setUp(() {
    repository = MockMotelRepository();
    useCase = GetMotelsUseCase(repository: repository);
  });

  test('Should return a correct response of the list of motels', () async {
    final _fixture = fakeResponseEntity;
    when(repository.getMotels())
        .thenAnswer((_) async => Right(fakeResponseEntity));

    final _response = await useCase.call();
    final _result = _response.fold((l) => l, (r) => r);
    expect(_result, isA<ResponseList>());
  });

  test('Should  server failure when try get list', () async {
    when(repository.getMotels())
        .thenAnswer((_) async => Left(ServerFailure(msg: 'error')));

    final _response = await useCase.call();
    final _result = _response.fold((l) => l, (r) => r);
    expect(_result, isA<ServerFailure>());
  });
}
