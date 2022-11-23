import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_library/http_library.dart';
import 'package:http_library/test_data.dart';

import '../models/res_model.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  TestPageState createState(){
    return TestPageState();
  }
}

class TestPageState extends State<TestPage> {
  late Future <ResModel> response;
  late final HttpLibrary httpLibrary;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpLibrary = HttpLibrary();



    //check get, post, put, delete methods for status code 200
    //response = httpLibrary.sendRequest(url: status200Url, method: 'get');
    //response = httpLibrary.sendRequest(url: status200Url, method: 'post');
    //response = httpLibrary.sendRequest(url: status200Url, method: 'delete');
    //response = httpLibrary.sendRequest(url: status200Url, method: 'put');

    //check get, post, put, delete methods for status code 400
    //response = httpLibrary.sendRequest(url: status400Url, method: 'get');
    //response = httpLibrary.sendRequest(url: status400Url, method: 'post');
    //response = httpLibrary.sendRequest(url: status400Url, method: 'delete');
    //response = httpLibrary.sendRequest(url: status400Url, method: 'put');

    //check get method with headers to get guthub users using Github API
    response = httpLibrary.sendRequest(url: githubUrl, method: 'GET', headers: githubHeaders);

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
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
              return Text(
                snapshot.data?.msg ?? 'Network Error',
                style: const TextStyle(
                  fontSize: 17
                ),
              );
            } else if (snapshot.hasError) {
              return const Text(
                'There is an error'
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      )
    );
  }
}
