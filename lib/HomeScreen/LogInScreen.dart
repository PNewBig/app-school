import 'package:flutter/material.dart';
import '../Widget/InputTextField.dart';
import '../Widget/LabelForgetPAS.dart';
import '../Widget/LabelText.dart';
import '../Widget/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  void _SubmitForm(String email, String password,) async {
    final UserCredential authResult;
    final auth = FirebaseAuth.instance;
    try{
      print(email);
      print(password);
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(error){
      print(error.toString());
    }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpeg'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black38, BlendMode.softLight),
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 100,
              child: Container(
                height: 200,
                width: 200,
                child: Image(image: AssetImage("assets/images/login.png")),
              )),
          Positioned(
            top: 180,
            child: Container(
                width: 400,
                height: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  //Title text
                  Text(
                    'Sign in',
                    style: TextStyle(
                      color: Color.fromARGB(255, 232, 232, 232),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  // SizedBox(height: 20),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Color.fromARGB(255, 232, 232, 232),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                 SizedBox(height: 10),

                  Text(
                    'You have been missed',
                    style: TextStyle(
                      color: Color.fromARGB(255, 232, 232, 232),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  InputTexfield(functionHandler: _SubmitForm),
                ]),
              ),
          ),
        ],
      ),
    );
  }
}
