import 'package:flutter/material.dart';
import 'package:mini_chat_custom_image_picker_library/view_models/full_screen_image_view_model.dart';
import 'package:mini_chat_custom_image_picker_library/view_models/full_screen_video_view_model.dart';
import 'package:mini_chat_custom_image_picker_library/view_models/image_view_model.dart';
import 'package:mini_chat_custom_image_picker_library/views/grid_photo_view.dart';
import 'package:mini_chat_custom_image_picker_library/views/image_view.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int start = 0;
  int end = 19;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ImageViewModel(),
        ),
      ],
      child: ImageView()
      // const MaterialApp(
      //   home: ImageView(),
      // ),
    );
  }
}

Widget anonyWidget() {
  return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ImageViewModel(),
        ),
      ],
      child: ImageView()
    // const MaterialApp(
    //   home: ImageView(),
    // ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onPhotoClick,
              icon: const Icon(Icons.collections),
            ),
          ],
        ),
      ),
    );
  }

  void onPhotoClick() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ImageView()),
    );
  }
}
