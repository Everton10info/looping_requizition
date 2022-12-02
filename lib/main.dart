import 'package:flutter/material.dart';
import 'package:looping_requizition/requisition-status/controllers/controller.dart';
import 'package:looping_requizition/core/httpClient/http_client.dart';
import 'package:looping_requizition/requisition-status/repositories/repository.dart';

import 'requisition-status/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estudos sobre requisição',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        controller: ControllerStatusCode(
          RepositoryStatusCode(
            HttpDio(),
          ),
        ),
      ),
    );
  }
}
