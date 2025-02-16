import 'package:flutter/material.dart';
import 'package:travel_bee/themes/font_theme.dart';
import 'package:travel_bee/widgets/auth/input_field.dart';
import 'package:travel_bee/widgets/common/width_button.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    super.key,
    required this.isLogin,
  });

  final bool isLogin;
  @override
  State<StatefulWidget> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = {};

  void onSave(String key, String? value) {
    _formData[key] = value;
  }

  String? onValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.isLogin
              ? const SizedBox.shrink()
              : InputField(
                  label: 'Name',
                  onSave: (String? value) {
                    onSave('Name', value);
                  },
                  onValidation: onValidation,
                ),
          SizedBox(
            height: widget.isLogin ? 0 : 32,
          ),
          InputField(
            label: 'Email',
            onSave: (String? value) {
              onSave('email', value);
            },
            onValidation: onValidation,
          ),
          const SizedBox(
            height: 32,
          ),
          InputField(
            label: 'Password',
            hideText: true,
            onSave: (String? value) {
              onSave('password', value);
            },
            onValidation: onValidation,
          ),
          const SizedBox(
            height: 64,
          ),
          WidthButton(
            text: widget.isLogin ? 'Log In' : 'Sign Up',
          ),
        ],
      ),
    );
  }
}
