import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/data/datasource/client/http_service.dart';
import 'package:guia_moteis/data/datasource/motels_remote_datasource.dart';
import 'package:guia_moteis/data/datasource/motels_remote_datasource_impl.dart';
import 'package:guia_moteis/domain/entities/response/response_list.dart';
import 'package:guia_moteis/infra/const/endpoints.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixture/fixture.dart';
import 'motel_datasource_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  late HttpService mockHttp;
  late MotelsRemoteDatasource dataSource;

  setUp(() {
    mockHttp = MockHttpService();
    dataSource = MotelsRemoteDatasourceImpl(http: mockHttp);
  });

  group('test motel datasource', () {
    test('Should return a list of data when trying to get', () async {
      final _fixture = fakeResponseHttp;
      when(mockHttp.getMethod(Uri.parse(Endpoints.getMotel))).thenAnswer(
        (_) async => Response.bytes(utf8.encode(jsonEncode(_fixture)), 200),
      );
      final _response = await dataSource.getMotels();
      expect(_response, isA<ResponseList>());
      expect(_response.data.length, 1);
      expect(_response.sucess, true);
      expect(_response.pageInfo.quantityItens, 10);
    });
    test('Should return an empty list when trying to get the items', () async {
      final _fixture = fakeEmptyResponseHttp;
      when(mockHttp.getMethod(Uri.parse(Endpoints.getMotel))).thenAnswer(
        (_) async => Response(jsonEncode(_fixture), 200),
      );
      final _response = await dataSource.getMotels();
      expect(_response, isA<ResponseList>());
      expect(_response.data.isEmpty, true);
    });
    test('Should throw an exception when trying to get a list.', () {
      when(mockHttp.getMethod(Uri.parse(Endpoints.getMotel)))
          .thenThrow(Exception('error'));
      expect(
          () async => await dataSource.getMotels(), throwsA(isA<Exception>()));
    });
  });
}
