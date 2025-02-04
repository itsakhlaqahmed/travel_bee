import 'package:flutter/material.dart';
import 'package:travel_bee/widgets/auth/auth_form.dart';
import 'package:travel_bee/widgets/layout.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      topBar: false,
      child: AuthForm(),
    );
  }
}
