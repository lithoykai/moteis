import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@injectable
class HttpService {
  final Client _http;

  HttpService({required Client http}) : _http = http;

  Future<Response> getMethod(Uri uri) async {
    return _http.get(uri);
  }
}
