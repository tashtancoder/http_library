import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_library/http_library.dart';
import 'package:http_library/models/http_res_model.dart';
import 'package:http_library/models/res_code_200.dart';
import 'package:http_library/models/res_code_400.dart';
import 'package:http_library/models/res_code_401.dart';
import 'package:http_library/models/res_code_403.dart';
import 'package:http_library/models/res_code_404.dart';
import 'package:http_library/models/res_code_500.dart';
import 'package:http_library/test_data.dart';


class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  TestPageState createState(){
    return TestPageState();
  }
}

class TestPageState extends State<TestPage> {
  late Future <HttpResModel> response; // Response declaration
  late final HttpLibrary httpLibrary;  // HttpLibrary declaration

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpLibrary = HttpLibrary(); // get instanse of HttpLibrary

    //check get, post, put, delete methods for status code 200
    response = httpLibrary.sendRequest(url: status200Url, method: 'get');
    //response = httpLibrary.sendRequest(url: status200Url, method: 'getit'); // incorrect method example
    //response = httpLibrary.sendRequest(url: status200Url, method: 'post');
    //response = httpLibrary.sendRequest(url: status200Url, method: 'delete');
    //response = httpLibrary.sendRequest(url: status200Url, method: 'put');

    //check get, post, put, delete methods for status code 400
    //response = httpLibrary.sendRequest(url: status400Url, method: 'get');
    // response = httpLibrary.sendRequest(url: status400Url, method: 'post', parameters: {'test': 0});
    //response = httpLibrary.sendRequest(url: status400Url, method: 'delete');
    //response = httpLibrary.sendRequest(url: status400Url, method: 'put');

    //check get method with headers to get guthub users using Github API
    //response = httpLibrary.sendRequest(url: githubUrl, method: 'GET', headers: githubHeaders);

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( // App Bar
        title: const SizedBox(
          width: double.infinity,
          child: Text(
            'Http Library Test',
            textAlign: TextAlign.center,
          ),
        ),
      ),

      body: Center(
        child: FutureBuilder(
          future: response,
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'statusCode ${snapshot.data?.statusCode().toString() ?? '0'}',
                    style: const TextStyle(
                        fontSize: 18
                    ),
                  ), // Status Code
                  Text(
                    snapshot.data?.msg() ?? 'Something went wrong',
                    style: TextStyle(
                        fontSize: 17,
                        color: defineColorByResClassType(snapshot.data ?? ResCode500())
                    ),
                  ), // Message
                ],
              );
            } else if (snapshot.hasError) {
              return const Text(
                'Не верный метод',
                style: TextStyle(fontSize: 17),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      )
    );
  }

  Color defineColorByResClassType(HttpResModel result) {
    Color color = Colors.green;
    if (result is ResCode400) {
      color = Colors.brown;
    } else if (result is ResCode401) {
      color = Colors.deepOrange;
    } else if (result is ResCode403) {
      color = Colors.amber;
    } else if (result is ResCode404) {
      color = Colors.red;
    } else if (result is ResCode500) {
      color = Colors.yellowAccent;
    }
    return color;
  }
}
