import 'package:http_library/models/http_res_model.dart';

class ResCode404 extends HttpResModel {
  @override
  String msg() {
    // TODO: implement msg
    return 'Запрашиваемый ресурс отсутствует';
  }

  @override
  int statusCode() {
    // TODO: implement statusCode
    return 404;
  }

}