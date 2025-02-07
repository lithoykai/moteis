import 'package:guia_moteis/domain/entities/motel/motel.dart';
import 'package:guia_moteis/domain/entities/response/response_list.dart';

abstract interface class MotelsRemoteDatasource {
  Future<ResponseList<Motel>> getMotels();
}
