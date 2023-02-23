import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:mini_chat_custom_image_picker_library/test_library.dart';
import 'package:mini_chat_custom_image_picker_library_example/sample_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _library = TestLibrary();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _library.getScreen(context);
                },
                child: Text('test'),
              ),
              Text(getList()),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SampleView()));
                },
                child: Text('level3'),
              )
            ],
          ),
        ));
  }

  void onClickLoadButton() {}

  String getList() {
    String result = '';
    setState(() {
      result = _library.getPickedList();
    });
    print('its called here');
    return result;
  }
}
