import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'auth/auth_screen.dart';
import 'loading_screen/splash_screen.dart';
import 'pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SplashScreen());
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyCyIQ7dsZVHg37gcBiAsK2K5Ev4bShYZ7c",
          appId: "1:631352079526:android:af104e752ea60434153067",
          messagingSenderId: "631352079526",
          projectId: "samruddhi-roadlines",
        ))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, usersnapshot) {
              if (usersnapshot.hasData) {
                return const Home();
                // return PushNotificationScreen();
              } else {
                Fluttertoast.showToast(
                    msg: "Please Login",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.amber,
                    textColor: Colors.white,
                    fontSize: 16.0);
                return const AuthScreen();
              }
            }));
  }
}
