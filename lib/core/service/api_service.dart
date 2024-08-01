import 'package:dio/dio.dart';
import 'package:payments_getway/core/utils/api_key.dart';

class ApiService {
  final dio = Dio();

  Future<Response> get({required String url}) async {
    var response = await dio.get(url);
    return response;
  }

  Future<Response> post(
      {required String url,
      required body,
      Map<String, dynamic>? headers,
      String? contentType}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          headers:
              headers ?? {'Authorization': 'Bearer ${ApiKey.stripSecretKey}'},
        ));
    return response;
  }
}
