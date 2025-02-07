import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @factoryMethod
  http.Client dio() => http.Client();
}
