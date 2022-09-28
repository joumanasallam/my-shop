import 'package:flutter/material.dart' show BuildContext, Colors, Key, MaterialApp, StatelessWidget, ThemeData, Widget, WidgetsFlutterBinding, runApp;
import 'package:shopping/shared/network/remote/cache_helper.dart';
import 'package:shopping/shared/network/remote/diohelper.dart';

import 'modules/welcome_screen.dart';
import 'shared/network/remote/diohelper.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.white70,
          primaryColor: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.grey[200]),
      color: Colors.deepPurple,
      home: const Welcome(),
    );
  }
}
