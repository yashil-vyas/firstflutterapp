import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int days= 3;
    const name = "Yash";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to Flutter Catalog app $days nd day by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}