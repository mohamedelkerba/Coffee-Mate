import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myproject/auth/MainPage.dart';
import 'package:myproject/auth/login.dart';
import 'package:myproject/auth/register.dart';
import 'package:myproject/firebase_options.dart';
import 'package:myproject/homePage.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('--------->User is currently signed out!');
      } else {
        print('--------->User is signed in!');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  FirebaseAuth.instance.currentUser == null ? MainPage() : const HomePage(),

      routes: {
        'register' : (context)=> const RegisterPage(),
        'login': (context) => const LoginPage(),
        'homepage' : (context) => const HomePage(),
      },
    );
  }
}


