import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_bee/services/auth_service.dart';
import 'package:travel_bee/themes/font_theme.dart';
import 'package:travel_bee/widgets/auth/input_field.dart';
import 'package:travel_bee/widgets/common/width_button.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    super.key,
    required this.isLogin,
  });
  const AuthForm({
    super.key,
    required this.isLogin,
  });

  final bool isLogin;
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
  final _formData = {};
  bool _isLoading = false;
  void onSave(String key, String? value) {
    _formData[key] = value;
  }

  String? onValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  Future<void> _login() async {
    await AuthService().signOut();

    try {
      User? user = await AuthService().signInWithEmailAndPassword(
        email: _formData['email'],
        password: _formData['password'],
      );
    } catch (e) {
      if (kDebugMode) {
        print('Auth Error A-101');
      }
    }
  }

  Future<void> _signup() async {
    bool validated = _formKey.currentState!.validate();
    if (validated) {
      _formKey.currentState!.save();
      try {
        User? user = await AuthService().createUserWithEmailAndPassword(
          email: _formData['email'],
          password: _formData['password'],
        );
      } catch (err) {
        // handle error here
      }
    }
  }

  void _submitForm() async {
    setState(() {
      _isLoading = true;
    });

    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      widget.isLogin ? await _login() : await _signup();
    }

    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
            height: widget.isLogin ? 0 : 32,
          ),
          InputField(
            label: 'Email',
            onSave: (String? value) {
              onSave('email', value);
            },
            onValidation: onValidation,
            onSave: (String? value) {
              onSave('email', value);
            },
            onValidation: onValidation,
          ),
          const SizedBox(
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
            hideText: true,
            onSave: (String? value) {
              onSave('password', value);
            },
            onValidation: onValidation,
          ),
          const SizedBox(
          const SizedBox(
            height: 64,
          ),
          WidthButton(
            text: widget.isLogin ? 'Log In' : 'Sign Up',
          ),
          WidthButton(
            text: widget.isLogin ? 'Log In' : 'Sign Up',
            onClick: _submitForm,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
