import 'package:http_library/models/http_res_model.dart';

class ResCode401 extends HttpResModel {
  @override
  String msg() {
    // TODO: implement msg
    return 'Не удачная авторизация';
  }

  @override
  int statusCode() {
    // TODO: implement statusCode
    return 401;
  }

}