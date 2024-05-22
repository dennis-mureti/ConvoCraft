import 'package:convocraft/components/textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          const Icon(
            Icons.message,
            size: 80,
          ),
          //welcome back message
          const Text(
            "welcome Back you have been missed",
            style: TextStyle(fontSize: 16),
          ),
          // email tetxtfeild
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),

          //password textt
        ],
      ),
    );
  }
}
