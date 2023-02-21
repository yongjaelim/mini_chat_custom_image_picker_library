import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:mini_chat_custom_image_picker_library/mini_chat_custom_image_picker_library.dart';
import 'package:mini_chat_custom_image_picker_library/test_library.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _miniChatCustomImagePickerLibraryPlugin =
      MiniChatCustomImagePickerLibrary();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _miniChatCustomImagePickerLibraryPlugin.getPlatformVersion() ??
              'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
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
        body:
        // _library.testWidget()

        Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _library.getScreen(context);
                },
                child: Text('test'),
              ),
              if(_library.pickedList.isNotEmpty)
              Text(_library.pickedList.first.id.toString())
            ],
          ),
        )

      // Center(
      //   child: Text('Running on: $_platformVersion\n'),
      // ),
    );
  }

  void onClickLoadButton() {

  }
}

