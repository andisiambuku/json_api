import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'data_service.dart';
import 'package:http/http.dart' as http;

Future<Kilo> fetchKilo() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),);

  if (response.statusCode == 200) {
    print(response.body.toString());
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Kilo.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Kilo> futureKilo;

  @override
  void initState() {
    super.initState();
    futureKilo = fetchKilo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Api Example',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Json Api Example'),
        ),
        body: Center(
          child: FutureBuilder<Kilo>(
            future: futureKilo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.body);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
