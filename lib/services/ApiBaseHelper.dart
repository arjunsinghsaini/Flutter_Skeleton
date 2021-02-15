import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_app_skeleton/config/index.dart';
import 'package:http/http.dart' as http;

import 'AppException.dart';
import 'URL.dart';

class ApiBaseHelper {
  static Connectivity connectivity = new Connectivity();
  final Duration TIMEOUT_DURATION = Duration(seconds: 120);

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.get(URL.BASE_URL + url, headers: headers).timeout(TIMEOUT_DURATION);
      responseJson = _returnResponse(response);
      Utility.logsInDebug(URL.BASE_URL + url + headers.toString());
    } on TimeoutException {
      Utility.logsInDebug("timeout");
      return null;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithOutToken(String url) async {
    var responseJson;
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.get(URL.BASE_URL + url, headers: headers).timeout(TIMEOUT_DURATION);
      responseJson = _returnResponse(response);
      Utility.logsInDebug(URL.BASE_URL + url + header.toString());
    } on TimeoutException {
      Utility.logsInDebug("timeout");
      return null;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic request) async {
    var responseJson;
    try {
      Utility.logsInDebug(URL.BASE_URL + url + " " + request.toString());
      Map<String, String> headers = header();
      final response = await http.post(URL.BASE_URL + url, body: request, headers: headers).timeout(TIMEOUT_DURATION);
      responseJson = _returnResponse(response);
    } on TimeoutException {
      return null;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postWithOutContentType(String url, dynamic request) async {
    var responseJson;
    try {
      Utility.logsInDebug(URL.BASE_URL + url + " " + request.toString());
      Map<String, String> headers = headerWOContentType();
      final response = await http.post(URL.BASE_URL + url, body: request, headers: headers).timeout(TIMEOUT_DURATION);
      responseJson = _returnResponse(response);
    } on TimeoutException {
      return null;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic request) async {
    var responseJson;
    try {
      Map<String, String> headers = header();
      final response = await http.put(URL.BASE_URL + url, body: request, headers: headers).timeout(TIMEOUT_DURATION);
      Utility.logsInDebug(URL.BASE_URL + url + " " + request.toString() + headers.toString());
      responseJson = _returnResponse(response);
    } on TimeoutException {
      return null;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var responseJson;
    try {
      Map<String, String> headers = header();
      final response = await http.delete(URL.BASE_URL + url, headers: headers).timeout(TIMEOUT_DURATION);
      Utility.logsInDebug(URL.BASE_URL + url + headers.toString());
      responseJson = _returnResponse(response);
    } on TimeoutException {
      return null;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postFile(String url, String path, dynamic requestPayload) async {
    var responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(URL.BASE_URL + url));
      Map<String, String> headers = header();
      if (requestPayload != null) {
        requestPayload.forEach((k, v) {
          if (v is Map) {
            request.fields[k] = json.encode(v);
          } else
            request.fields[k] = v.toString();
        });
      }
      request.files.add(await http.MultipartFile.fromPath('file', path));
      request.headers.addAll(headers);
      final res = await request.send().timeout(TIMEOUT_DURATION);
      var response = await res.stream.bytesToString();
      responseJson = json.decode(response);
      Utility.logsInDebug(
          URL.BASE_URL + url + " " + request.toString() + "/n" + responseJson.toString() + "/n" + headers.toString());
    } on TimeoutException {
      return null;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic header() {
    Map<String, String> header = {"accept": "application/json", "Content-Type": "application/json"};
    if (Constant.TOKEN != null) {
      header['Authorization'] = "Bearer " + Constant.TOKEN;
    }
    return header;
  }

  dynamic headerMultiPart() {
    Map<String, String> header = {"accept": "multipart/form-data", "Content-Type": "multipart/form-data"};
    if (Constant.TOKEN != null) {
      header['Authorization'] = "Bearer " + Constant.TOKEN;
    }
    return header;
  }

  dynamic headerWOContentType() {
    Map<String, String> header = {"accept": "application/json"};
    if (Constant.TOKEN != null) {
      header['Authorization'] = "Bearer " + Constant.TOKEN;
    }
    return header;
  }

  dynamic _returnResponse(http.Response response) {
    var responseJson = json.decode(response.body.toString());
    Utility.logsInDebug(responseJson.toString());
    // if (responseJson['statusCode'] == 401) {
    //   Utility.showSnackBarX(Strings.msgEnterEmail);
    //   SharedPrefs.clearSharedPrefsDataWOOnBoard();
    //   Future.delayed(const Duration(milliseconds: 3500), () {
    //     Get.offAll(SplashScreen());
    //   });
    //   return null;
    // }
    return responseJson;
  }
}
