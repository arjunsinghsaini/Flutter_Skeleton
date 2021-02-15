import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_skeleton/config/index.dart';

import 'ApiBaseHelper.dart';

class ApiRepository {
  static ApiRepository _apiRepository;

  static ApiRepository get apiRepository {
    if (_apiRepository == null) {
      _apiRepository = new ApiRepository();
      return _apiRepository;
    } else
      return _apiRepository;
  }

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> deleteRequest(url, BuildContext context) async {
    if (!await Utility.isInternetAvailable(showDialog: true)) return;
    final response = await _helper.delete(url);
    return response;
  }

  Future<dynamic> getRequest(url, BuildContext context) async {
    if (!await Utility.isInternetAvailable(showDialog: true)) return;
    final response = await _helper.get(url);
    return response;
  }

  Future<dynamic> getRequestWithoutToken(url, BuildContext context) async {
    final response = await _helper.getWithOutToken(url);
    return response;
  }

  Future<dynamic> postRequest(url, request, BuildContext context) async {
    if (!await Utility.isInternetAvailable(showDialog: true)) return;
    final response = await _helper.post(url, request);
    return response;
  }

  Future<dynamic> postRequestWOContentType(url, request, BuildContext context) async {
    if (!await Utility.isInternetAvailable(showDialog: true)) return;
    final response = await _helper.postWithOutContentType(url, request);
    return response;
  }

  Future<dynamic> putRequests(url, request, BuildContext context) async {
    if (!await Utility.isInternetAvailable(showDialog: true)) return;
    final response = await _helper.put(url, request);
    return response;
  }

  Future<dynamic> uploadFile(url, path, request) async {
    if (!await Utility.isInternetAvailable(showDialog: true)) return;
    final response = await _helper.postFile(url, path, request);
    return response;
  }
}
