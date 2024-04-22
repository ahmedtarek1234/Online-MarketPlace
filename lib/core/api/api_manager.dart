import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/constants.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response>getData({required String endPoint,Map<String,dynamic>? queryParam}){

    return dio.get(constants.BaseUrl+endPoint,queryParameters: queryParam);
  }

  Future<Response>postData({required String endPoint,Map<String,dynamic>? body}){

    return dio.post(constants.BaseUrl+endPoint,data: body);
  }
}
