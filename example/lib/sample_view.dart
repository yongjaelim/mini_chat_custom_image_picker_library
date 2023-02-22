import 'package:flutter/material.dart';
import 'package:mini_chat_custom_image_picker_library/test_library.dart';

class SampleView extends StatelessWidget {
  const SampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _library = TestLibrary();
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample View'),
      ),
      body: Center(
        child: Text(
          _library.getPickedList()
        ),
      ),
    );
  }
}
