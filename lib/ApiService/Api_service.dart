import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';
import '../GetStorage/HiveBox.dart';
import '../GetStorage/shared_prefs_service.dart';
import '../ModelClass/RefreshTokenModel/TokenRefresh.dart';
import '../Apicalls/Apis.dart';

class ApiService {
  late String? baseUrl = Apis.baseUrl;
  static final ApiService _instance = ApiService._internal();

  bool isLoading = false;
  ApiService._internal();
  final GetStorage storage = GetStorage();
  RefreshToken token = RefreshToken();
  final dioClient = dio.Dio();

  static ApiService getInstance() {
    return _instance;
  }

  Future<bool> putrequestForRefreshToken() async {
    final response = await dioClient.put(
      "https://uat.careaxes.net/uat-qa-api/api/account/refresh-authentication",
      options: dio.Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      data: jsonEncode({
        "token": HiveBox().GetReferenceToken().toString(),
      }),
    );

    if (response.statusCode == 200) {
      token = RefreshToken.fromJson(jsonDecode(response.data));
      HiveBox().StoreToken(token.token!.split(' ')[1]);
      return true;
    } else {
      print("Token refresh failed: ${response.data}");
      return false;
    }
  }

  Future<dio.Response> getRequest(String endpoint) async {
    return _handleRequest(
          () => dioClient.get(
        "$baseUrl/$endpoint",
        options: dio.Options(headers: defaultHeaders()),
      ),
    );
  }

  Future<dio.Response> postRequest(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    return _handleRequest(
          () => dioClient.post(
        "$baseUrl/$endpoint",
        options: dio.Options(headers: defaultHeaders(headers)),
        data: jsonEncode(data),
      ),
    );
  }

  Future<dio.Response> putRequest(String endpoint, Map<String, dynamic> data) async {
    return _handleRequest(
          () => dioClient.put(
        "$baseUrl/$endpoint",
        options: dio.Options(headers: defaultHeaders()),
        data: jsonEncode(data),
      ),
    );
  }

  Future<void> deleteRequest(String endpoint) async {
    await _handleRequest(
          () => dioClient.delete(
        "$baseUrl/$endpoint",
        options: dio.Options(headers: defaultHeaders()),
      ),
    );
  }

  Future<dio.Response> PostFormData(String endpoint, Map<String, dynamic> formData) async {
    return _handleRequest(
          () {
        var data = dio.FormData.fromMap(formData);
        return dioClient.post(
          "$baseUrl/$endpoint",
          data: data,
         options: dio.Options(headers: defaultHeaders()),
        );
      },
    );
  }

  Map<String, dynamic> defaultHeaders([Map<String, String>? additionalHeaders]) {
    var headers = {
      'Authorization': 'Bearer ${HiveBox().getToken()}',
     // 'content-Type': 'application/json; charset=UTF-8',
     //  'LocationId': SharedPrefsService().GetPrefferedLocation(),
    };
    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }
    return headers;
  }

  Future<dio.Response> _handleRequest(Future<dio.Response> Function() request,
      {int retryCount = 1}) async {
    dio.Response response;

    try {
      response = await request();
      print("response is ${response}");

      if (response.statusCode == 401 && retryCount > 0) {
        var tokenRefreshed = await putrequestForRefreshToken();
        if (tokenRefreshed) {
          return _handleRequest(request, retryCount: retryCount - 1);
        } else {
          throw dio.DioError(
            requestOptions: response.requestOptions,
            response: response,

            error: 'Token refresh failed',
          );
        }
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }

    return response;
  }
}
