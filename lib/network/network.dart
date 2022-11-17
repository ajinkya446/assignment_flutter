import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../commons/constants.dart';
import '../commons/helper_methods.dart';

class ApiService {
  static Future getApiRequest(String apiUrl, {String? token}) async {
    final statusResult = await InternetConnectionHelper.checkInternetConnection();
    if (statusResult == true) {
      String url = '${ApiConstants.baseUrl}/$apiUrl';
      final response = await Dio().get(url,
          options: Options(
              responseType: ResponseType.json,
              headers: {'Content-Type': 'application/json', 'Accept': 'application/json', 'x-auth-token': token ?? ''},
              validateStatus: (status) {
                if (status == 400) {
                  return true;
                } else if (status == 200) {
                  return true;
                } else if (status == 401) {
                  return true;
                }
                return true;
              }));
      return response;
    }
  }

  static Future postApiRequest(dynamic body, String apiUrl, Map<String, String>? header) async {
    try {
      final statusResult = await InternetConnectionHelper.checkInternetConnection();
      if (statusResult == true) {
        final response = await Dio()
            .post(
              '${ApiConstants.baseUrl}/$apiUrl',
              data: body,
              options: Options(
                  headers: header,
                  validateStatus: (status) {
                    if (status == 400) {
                      return true;
                    } else if (status == 200) {
                      return true;
                    } else if (status == 401) {
                      return true;
                    }
                    return true;
                  }),
            )
            .timeout(const Duration(minutes: 1));
        return response;
      }
    } on TimeoutException catch (_) {
      // A timeout occurred.
      HelperMethods.showToast(MessageConstants.serverTimeoutOccurred);
      HelperMethods.showToast('Server Timeout occurred');
    } on SocketException catch (_) {
      // Other exception
      HelperMethods.showToast(MessageConstants.socketErrorOccurred);
      HelperMethods.showToast('Socket Error occurred');
    } catch (e) {
      rethrow;
    }
  }
}
