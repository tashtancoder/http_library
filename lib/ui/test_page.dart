import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_library/http_library.dart';

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
    const String token = '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';
    //const String token = 'github_pat_11ACYEAKY01z5BZvvtscjr_JC3iJWrhpvw5Gi5I8LRFn7YnKLoNzNyaGC7BdFKBF5yLE'; //wrong token
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'bearer ${token}'
    };
    response = httpLibrary.sendRequest(url: 'https://api.github.com/users/mojombo', method: 'GET', headers: headers);

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
                  fontSize: 18
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
