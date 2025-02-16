import 'package:flutter/material.dart';

enum CustomSnackbar {
  success,
  error,
}

class CustomSnackBarBuilder {
  final Color kSuccessColor = const Color.fromARGB(255, 103, 194, 58);
  final Color kErrorColor = const Color.fromARGB(255, 245, 108, 108);

  void showCustomSnackBar(
    BuildContext context, {
    required CustomSnackbar snackBarType,
    required String text,
  }) {
    bool isSuccessBar = snackBarType == CustomSnackbar.success;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 2000),
        content: Container(
          // height: 300,
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: snackBarType == CustomSnackbar.success
                    ? kSuccessColor
                    : kErrorColor,
                offset: const Offset(1, 1),
                blurRadius: 8,
              ),
            ],
            color: isSuccessBar ? kSuccessColor : kErrorColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                isSuccessBar
                    ? Icons.check_circle_outline_rounded
                    : Icons.error_outline_outlined,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isSuccessBar ? 'Hurrah!' : 'Oh Snap!',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    // const Spacer(),
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
