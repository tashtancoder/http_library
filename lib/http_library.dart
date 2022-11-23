

import 'dart:convert';
import 'dart:io';

import 'package:http_library/constants.dart';

import 'models/res_model.dart';
class HttpLibrary {
  late final HttpClient _client;
  late final HttpClientRequest _httpRequest;
  late final HttpClientResponse _httpResponse;
  late ResModel _response;
  HttpLibrary(){
    _client = HttpClient();
  }

  Future <ResModel> sendRequest({
    required String url,
    required String method,
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
    String format = 'json'
  }) async {
    //response = ResModel(statusCode: 500, msg: 'Произошла неизвестная ошибка');
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
        _response = ResModel(statusCode: 500, msg: 'Не известный метод');
      }
    }
    if (_httpRequest != null) {
      if (headers != null) {
        _addHeaders(headers);
      }
      try {
        _httpResponse = await _httpRequest.close();
        print(_httpResponse.statusCode);
        final content = await utf8.decodeStream(_httpResponse);
        print(content);
        _response = ResModel(statusCode: _httpResponse.statusCode, msg: errorMsgs[_httpResponse.statusCode] ?? 'Произошла неизвестная ошибка');
      } catch (error) {
        print(error);
        _response = ResModel(statusCode: 500, msg: 'Произошла неизвестная ошибка');
      }
    }
    return _response;
  }

  _addHeaders(Map<String, String> headers){
    headers.forEach((key, value) {
      _httpRequest.headers.add(key, value);
    });
  }
}
