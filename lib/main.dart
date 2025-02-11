import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcpp_test/webview_stuff.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? usingHCPP = null;

  @override
  void initState() {
    super.initState();
    HybridAndroidViewController.checkIfSupported().then((bool result) {
      setState(() {
        usingHCPP = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (usingHCPP) {
      case null:
        return Center(child: Text('Loading...'));
      case false:
        return Center(child: Text('HCPP Not Supported on this device.'));
      case true:
        break;
    }

    return WebViewExample();
  }
}
