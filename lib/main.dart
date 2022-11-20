import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:signin_page/HomeScreen/HomeScreen.dart';
import 'HomeScreen/LogInScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void showAlert(BuildContext context) {
    QuickAlert.show(context: context, type: QuickAlertType.error);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                showAlert(context);
                return Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasData) {
                return HomePage();
              } else {
                return LoginScreen();
              }
            }));
  }
}
