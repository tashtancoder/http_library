import 'package:http_library/models/http_res_model.dart';

class ResCode400 extends HttpResModel {
  @override
  String msg() {
    // TODO: implement msg
    return 'Данные не верны';
  }

  @override
  int statusCode() {
    // TODO: implement statusCode
    return 400;
  }

}