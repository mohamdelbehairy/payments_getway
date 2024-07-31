import 'package:dio/dio.dart';
import 'package:payments_getway/core/utils/api_key.dart';

class ApiService {
  final dio = Dio();

  Future<Response> get() async {
    var response = await dio.get('https://fakestoreapi.com/products');
    return response;
  }

  Future<Response> post({required String url, required body}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer ${ApiKey.secretKey}',
          },
        ));
    return response;
  }
}
