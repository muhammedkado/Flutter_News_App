import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // heloo
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     home: MyHomePage(),

    );
  }
}
class MyHomePage  extends StatelessWidget {
  const MyHomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),

      ),
      body: Column(),
    );
  }
}

