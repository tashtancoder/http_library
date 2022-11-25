import 'package:http_library/models/http_res_model.dart';

class ResCode403 extends HttpResModel {
  @override
  String msg() {
    // TODO: implement msg
    return 'У Вас нету доступа на данный сервис';
  }

  @override
  int statusCode() {
    // TODO: implement statusCode
    return 403;
  }

}