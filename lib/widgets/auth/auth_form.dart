import 'package:flutter/material.dart';
import 'package:travel_bee/themes/font_theme.dart';
import 'package:travel_bee/widgets/auth/input_field.dart';
import 'package:travel_bee/widgets/common/width_button.dart';

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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 32,
          ),
          Center(
            child: Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Center(
            child: Text(
              'Login to access your account',
              style: FontTheme.subHeadingStyle,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          InputField(
            label: 'Email',
          ),
          SizedBox(
            height: 32,
          ),
          InputField(
            label: 'Password',
          ),
          SizedBox(
            height: 64,
          ),
          WidthButton(),
        ],
      ),
    );
  }
}
