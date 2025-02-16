// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_bee/pages/main_home.dart';
import 'package:travel_bee/services/auth_service.dart';
import 'package:travel_bee/widgets/auth/input_field.dart';
import 'package:travel_bee/widgets/common/custom_snackbar.dart';
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

  navigateTo(BuildContext context, Widget page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => page));
  }

  Future<void> _login() async {
    await AuthService().signOut();

    await AuthService().signInWithEmailAndPassword(
      email: _formData['email'],
      password: _formData['password'],
    );
  }

  Future<void> _signup() async {
    _formKey.currentState!.save();

    // User? user =
    await AuthService().createUserWithEmailAndPassword(
      email: _formData['email'],
      password: _formData['password'],
    );
  }

  void _submitForm() async {
     setState(() {
      _isLoading = true;
    });
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      try {
        widget.isLogin ? await _login() : await _signup();

        // ignore: use_build_context_synchronously
        navigateTo(context, const MainHome());
      } catch (err) {
        CustomSnackBarBuilder().showCustomSnackBar(
          // ignore: use_build_context_synchronously
          context,
          snackBarType: CustomSnackbar.error,
          text: err.toString(),
        );
        if (kDebugMode) {
          print('Auth Error A-101');
          print(err.toString());
        }
      }
    }

    setState(() {
      _isLoading = false;
    });
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
            onClick: _submitForm,
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }
}
