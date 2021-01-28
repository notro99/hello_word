import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hello_word_android_studio/db/profile_repository.dart';
import 'package:hello_word_android_studio/db/sql.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  //final cameras = await availableCameras();

  //final camera = cameras.length > 0 ? cameras.first : null;

  final sql = Sql();
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => ProfileRepository(sql: sql),
        ),
        // A kamera a Provider-en keresztül lesz elérhető.
        //Provider.value(value: camera),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AbelBnB',
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: HomeScreen(),
    );
  }
}
