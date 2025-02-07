import 'dart:convert';

import 'package:guia_moteis/data/datasource/client/http_service.dart';
import 'package:guia_moteis/data/datasource/motels_remote_datasource.dart';
import 'package:guia_moteis/data/model/motel_model.dart';
import 'package:guia_moteis/domain/entities/motel/motel.dart';
import 'package:guia_moteis/domain/entities/response/response_list.dart';
import 'package:guia_moteis/infra/const/endpoints.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MotelsRemoteDatasource)
class MotelsRemoteDatasourceImpl implements MotelsRemoteDatasource {
  final HttpService _http;

  MotelsRemoteDatasourceImpl({required HttpService http}) : _http = http;

  @override
  Future<ResponseList<Motel>> getMotels() async {
    try {
      final _response = await _http.getMethod(Uri.parse(Endpoints.getMotel));
      final _body = jsonDecode(_response.body);
      final _data = _body['data'];
      final _moteis = (_data['moteis'] as List)
          .map((json) => MotelModel.fromJson(json).toEntity())
          .toList();

      if (_body["status"] == false) {
        throw Exception();
      }

      return ResponseList(
          sucess: _body["sucesso"],
          pageInfo: PageInfoResponse(
              quantityItens: _data['qtdPorPagina'],
              totalItens: _data['totalMoteis'],
              maxPageItens: _data['maxPaginas']),
          data: _moteis);
    } catch (e) {
      rethrow;
    }
  }
}
