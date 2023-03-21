import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_app/home.dart';
import 'package:new_app/service/landing.dart';
import 'auth.dart';
import 'service/services.dart';
import 'package:provider/provider.dart';

void main() async {
  // DBConnection().connectDB();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyThemeApp());
}

class MyThemeApp extends StatelessWidget {
  const MyThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthServices().currentUser,
        initialData: null,
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const LandingPage(),
            '/home': (context) => const HomePage(),
          },
        ));
  }
}
