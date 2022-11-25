import 'http_res_model.dart';

class ResCode500 extends HttpResModel {
  @override
  String msg() {
    // TODO: implement msg
    return 'Произошла неизвестная ошибка';
  }

  @override
  int statusCode() {
    // TODO: implement statusCode
    return 500;
  }

}