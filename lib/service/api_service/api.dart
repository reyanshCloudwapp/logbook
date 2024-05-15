import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:elogbook/model/login_response.dart';
import 'package:elogbook/model/update_profile_response.dart';
import 'package:elogbook/service/api_service/api_client.dart';
import 'package:elogbook/service/api_service/api_methods.dart';
import 'package:elogbook/utils/app_constants.dart';

class Api {
  final ApiMethods _apiMethods = ApiMethods();
  final ApiClient _apiClient = ApiClient();

  static final Api _api = Api._internal();
  final Connectivity connectivity = Connectivity();

  factory Api() {
    return _api;
  }

  Api._internal();

  Map<String, String> getHeader() {
    return {'Content-Type': 'application/json'};
  }

  Future<LoginResponse> loginApi(Map<String, String> body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      String res =
          await _apiClient.postMethod(method: _apiMethods.login, body: body);
      if (res.isNotEmpty) {
        try {
          return loginResponseFromJson(res);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          return LoginResponse(statusCode: 500, message: e.toString());
        }
      } else {
        return LoginResponse(statusCode: 500, message: AppConstants.somethingWentWrong);
      }
    } else {
      return LoginResponse(statusCode: 500, message:AppConstants.noInternet);
    }
  }

  Future<UpdateProfileResponse> updateProfileJson(var body) async {
    if (await connectivity.checkConnectivity() == ConnectivityResult.wifi ||
        await connectivity.checkConnectivity() == ConnectivityResult.mobile) {
      try {
        String res = await _apiClient.postMethodJson(
            method: _apiMethods.updateProfile,
            body: body,
            header: {'Content-Type': 'application/json'});
        if (res.isNotEmpty) {
          return updateProfileResponseFromJson(res);
        } else {
          return UpdateProfileResponse(
            status: 500,
            message: AppConstants.somethingWentWrong,
          );
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return UpdateProfileResponse(
          status: 500,
          message: e.toString(),
        );
      }
    } else {
      return UpdateProfileResponse(
        status: 500,
        message: AppConstants.noInternet,
      );
    }
  }
}
