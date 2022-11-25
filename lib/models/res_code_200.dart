import 'http_res_model.dart';

class ResCode200 extends HttpResModel {
  @override
  String msg() {
    // TODO: implement msg
    return 'Все прошло удачно';
  }

  @override
  int statusCode() {
    // TODO: implement statusCode
    return 200;
  }

}