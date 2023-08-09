import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Test Solid Software'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Color currentColor = Colors.white;

  void _colorShifter() {
    setState(() {
      currentColor = Color(Random().nextInt(0xFFFFFF)).withOpacity(1.0);
      print(currentColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _colorShifter(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          )),
          backgroundColor: currentColor,
        ),
        body: Container(
            color: currentColor,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            constraints: const BoxConstraints.expand(),
            child: const Center(
              child: Text(
                'Hello there',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: currentColor,
          onPressed: () {
            setState(() {
              currentColor = Colors.white;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.restart_alt, color: Colors.black),
              Text(
                "Reset",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
