import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_bee/themes/color_theme.dart';
import 'package:travel_bee/themes/font_theme.dart';
import 'package:travel_bee/widgets/auth/auth_form.dart';
import 'package:travel_bee/widgets/layout.dart';

class Auth extends StatefulWidget {
  const Auth({
    super.key,
  });

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool _isLoginSelected = false;

  final _selectedDecoration = BoxDecoration(
    color: ColorTheme.primaryColor,
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(25),
        blurRadius: 8,
        spreadRadius: 2,
        offset: const Offset(0, 4),
      ),
    ],
  );

  void onTabClick(int index) {
    setState(() {
      _isLoginSelected = index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        enablePadding: true,
        topBar: false,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              "@travel bee",
              style: GoogleFonts.cormorantGaramond().copyWith(
                fontSize: 60,
                fontWeight: FontWeight.w900,
                color: ColorTheme.primaryColor,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              _isLoginSelected ? 'Welcome Back' : 'Get Started Now',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              _isLoginSelected
                  ? 'Login to access your account'
                  : 'Create an account to get started',
              textAlign: TextAlign.center,
              style: FontTheme.subHeadingStyle,
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorTheme.backgroundGrey,
                borderRadius: BorderRadius.circular(48),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onTabClick(0);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration:
                            _isLoginSelected ? _selectedDecoration : null,
                        child: Text(
                          'Log In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                _isLoginSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        // ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onTabClick(1);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration:
                            _isLoginSelected ? null : _selectedDecoration,
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                _isLoginSelected ? Colors.black : Colors.white,
                          ),
                        ),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            AuthForm(
              isLogin: _isLoginSelected,
            ),
          ],
        ),
      ),
    );
  }
}
