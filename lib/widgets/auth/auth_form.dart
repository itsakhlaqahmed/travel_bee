import 'package:flutter/material.dart';
import 'package:travel_bee/themes/font_theme.dart';
import 'package:travel_bee/widgets/auth/input_field.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<StatefulWidget> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            InputField(),
          ],
        ));
  }
}
