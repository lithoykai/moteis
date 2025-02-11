import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/data/datasource/motels_remote_datasource.dart';
import 'package:guia_moteis/data/repository/motel_repository_impl.dart';
import 'package:guia_moteis/domain/entities/response/response_list.dart';
import 'package:guia_moteis/domain/repository/motel_repository.dart';
import 'package:guia_moteis/infra/failure/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixture/fixture.dart';
import 'motel_repository_test.mocks.dart';

@GenerateMocks([MotelsRemoteDatasource])
void main() {
  late MotelsRemoteDatasource dataSource;
  late MotelRepository repository;

  setUp(() {
    dataSource = MockMotelsRemoteDatasource();
    repository = MotelRepositoryImpl(datasource: dataSource);
  });

  group('test motel repository', () {
    test('Should return a ResponseList when trying to get the motels',
        () async {
      final _fakeEntity = fakeResponseEntity;
      when(dataSource.getMotels()).thenAnswer((_) async => _fakeEntity);

      final _response = await repository.getMotels();
      final _result = _response.fold((l) => l, (r) => r);
      expect(_result, isA<ResponseList>());
    });
    test('Should return a server failure when trying to get a list of motels',
        () async {
      when(dataSource.getMotels()).thenThrow((_) async => Exception('error'));

      final _response = await repository.getMotels();
      final _result = _response.fold((l) => l, (r) => r);
      expect(_result, isA<ServerFailure>());
    });
  });
}
