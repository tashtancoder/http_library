

import 'dart:io';

import 'package:http_library/constants.dart';

import 'models/res_model.dart';
class HttpLibrary {
  late final HttpClient _client;
  HttpLibrary(){
    _client = HttpClient();
  }
  late final ResModel _response;
  Future <ResModel> sendRequest({
    required String url,
    required String method,
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
    String format = 'json'
  }) async {
    ResModel res = ResModel(statusCode: 500, msg: 'Произошла неизвестная ошибка');
    late final HttpClientRequest request;
    if (method.toUpperCase() == 'GET') {
      request = await _client.getUrl(Uri.parse(url));
    } else if (method.toUpperCase() == 'POST') {
      request = await _client.postUrl(Uri.parse(url));
    } else if (method.toUpperCase() == 'PUT') {
      request = await _client.putUrl(Uri.parse(url));
    } else if (method.toUpperCase() == 'DELETE') {
      request = await _client.putUrl(Uri.parse(url));
    } else {
      ResModel res = ResModel(statusCode: 500, msg: 'Не известный метод');
    }

    if (headers != null) {
      headers.forEach((key, value) {
        request.headers.add(key, value);
      });
    }

    try {
      final response = await request.close();
      print(response.statusCode);
      res = ResModel(statusCode: response.statusCode, msg: errorMsgs[response.statusCode] ?? 'Произошла неизвестная ошибка');
    } catch (error) {
      print(error);
      ResModel res = ResModel(statusCode: 500, msg: 'Произошла неизвестная ошибка');

    }

    return res;
  }
}
