import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:student_list_provider/provider/img_function.dart';
import 'package:student_list_provider/provider/messages.dart';
import 'package:student_list_provider/provider/student_function.dart';
import 'package:student_list_provider/screens/home.dart';


import 'models/student_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudentImage(),
        ),
        ChangeNotifierProvider(
          create: (context) => StudentData(),
        ),
        ChangeNotifierProvider(
          create: (context) => AlertProvider(),
        ),
      ],
      child: MaterialApp(
        theme:ThemeData.dark(),
        home: const ScreenHome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
