import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:elogbook/routes/app_routes.dart';

class ApiClient extends GetConnect {
  static final ApiClient _apiClient = ApiClient._internal();

  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  static const baseAppUrl = 'http://randomnumber/';

  @override
  void onInit() {
    baseUrl = baseAppUrl;
  }

  Future<String> getMethod({
    required String method,
    Map<String, String>? header,
  }) async {
    try {
      log('$baseAppUrl$method');
      if (header != null) {
        log(header.toString());
      }
      // final response = await get('$baseAppUrl$method', headers: header);
      final response = await http.get(
        Uri.parse('$baseAppUrl$method'),
        headers: header,
      );
      log(response.body);
      return response.body;
    } catch (e) {
      log('______ getMethode error ${e.toString()}');
      return '';
    }
  }

  Future<String> postMethod({
    required method,
    required Map<String, String> body,
    Map<String, String>? header,
  }) async {
    try {
      log('$baseAppUrl$method');
      if (header != null) {
        log(header.toString());
      }
      log(body.toString());
      final response = await http.post(
        Uri.parse('$baseAppUrl$method'),
        body: body,
        headers: header,
      );
      log(response.body);

      return response.body;
    } catch (e) {
      log('______ post Method error ${e.toString()}');
      return '';
    }
  }

  Future<String> postMethodJson({
    required method,
    required var body,
    Map<String, String>? header,
  }) async {
    try {
      log('$baseAppUrl$method');
      if (header != null) {
        log(header.toString());
      }
      log(body.toString());
      //final response = await post(url, body, headers: header);
      final response = await http.post(
        Uri.parse('$baseAppUrl$method'),
        body: body,
        headers: header,
      );
      log(response.body);

      return response.body;
    } catch (e) {
      log('______ post Method error ${e.toString()}');
      return '';
    }
  }

  /// Post request with File
  /// final form = FormData({
  ///   'file': MultipartFile(image, filename: 'avatar.png'),
  ///   'otherFile': MultipartFile(image, filename: 'cover.png'),
  /// });
  Future<String> postWithMultiPart({
    required method,
    required FormData formData,
    Map<String, String>? headers,
  }) async {
    try {
      String url = '$baseAppUrl$method';
      log(url);
      log(formData.files.toString());
      log(formData.fields.toString());
      if (headers?.isNotEmpty ?? false) {
        log(headers.toString());
      }
      final response = await post(
        url,
        formData,
        headers: headers,
      );
      log(response.bodyString.toString());
      if (response.body['code'].toString() == '401') {
        //token expired
        Get.offAndToNamed(
          AppRoutes.signin,
          arguments: 'Session expired!!!\nPlease login again.',
        );
        return '';
      } else {
        return response.bodyString ?? '';
      }
    } catch (e) {
      log(e.toString());
      return '';
    }
  }

  Future<String> postMethodMultipart(http.MultipartRequest request) async {
    log(request.fields.toString());
    if (request.files.isNotEmpty) {
      for (var element in request.files) {
        log('___ file ${element.field.toString()} length = ${element.length}');
      }
    } else {
      log('___ file empty');
    }
    http.Response response =
        await http.Response.fromStream(await request.send());
    log(response.body.toString());
    final data = jsonDecode(response.body);
    if (data['code'].toString() == '401') {
      //token expired
      Get.offAndToNamed(
        AppRoutes.signin,
        arguments: 'Session expired!!!\nPlease login again.',
      );
      return '';
    } else {
      return response.body;
    }
  }
}
