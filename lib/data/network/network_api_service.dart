import 'dart:convert';
import 'dart:io';

import 'package:bloc_prac/data/network/base_api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/utils.dart';
import '../app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  dynamic returnResponse(http.Response response) {
    debugPrint('Response Status Code: ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        String errorString = response.body;
        String errorMessage = jsonDecode(errorString)['error'];
        throw BadRequestException(Utils.capitalize(errorMessage));
      case 404:
        throw UnauthorizedException(response.body);
      case 403:
        throw UnauthorizedException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection.');
    }
    return responseJson;
  }
}
