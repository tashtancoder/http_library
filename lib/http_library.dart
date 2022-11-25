

import 'dart:convert';
import 'dart:io';

import 'package:http_library/models/http_res_model.dart';
import 'package:http_library/models/res_code_200.dart';
import 'package:http_library/models/res_code_400.dart';
import 'package:http_library/models/res_code_401.dart';
import 'package:http_library/models/res_code_403.dart';
import 'package:http_library/models/res_code_404.dart';
import 'package:http_library/models/res_code_500.dart';

class HttpLibrary {
  late final HttpClient _client;
  late final HttpClientRequest _httpRequest;
  late final HttpClientResponse _httpResponse;
  HttpLibrary(){
    _client = HttpClient();
  }

  Future <HttpResModel> sendRequest({
    required String url,
    required String method,
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
    String format = 'json'
  }) async {

    method = method.toUpperCase();
    switch (method) {
      case 'GET': {
        _httpRequest = await _client.getUrl(Uri.parse(url));
      }
      break;

      case 'POST': {
        _httpRequest = await _client.postUrl(Uri.parse(url));
      }
      break;
      case 'DELETE': {
        _httpRequest = await _client.deleteUrl(Uri.parse(url));
      }
      break;
      case 'PUT': {
        _httpRequest = await _client.putUrl(Uri.parse(url));
      }
      break;
      default: {
        throw Exception('Incorrect Method');
      }
    }
    if (headers != null) {
      _addHeaders(headers);
    }

    _httpRequest.headers.contentType = ContentType('application', format, charset: 'utf-8');

    if (parameters != null){
      print(parameters);
      _httpRequest.write(parameters);
    }
    try {
      _httpResponse = await _httpRequest.close();
      print(_httpResponse.statusCode);
      final content = await utf8.decodeStream(_httpResponse);
      print(content);
      switch (_httpResponse.statusCode) {
        case 200:
          return ResCode200();
        case 400:
          return ResCode400();
        case 401:
          return ResCode401();
        case 403:
          return ResCode403();
        case 404:
          return ResCode404();
        default:
          return ResCode500();
      }
    } catch (error) {
      print(error);
      return ResCode500();
    }
  }

  _addHeaders(Map<String, String> headers){
    headers.forEach((key, value) {
      _httpRequest.headers.add(key, value);
    });
  }
}
