import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:travel_bee/themes/font_theme.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.label,
    this.placeholderText,
    this.placeholderIcon,
    this.onSave,
    this.onValidation,
    this.hideText,
    this.onChanged,
  });

  final String label;
  final String? placeholderText;
  final IconData? placeholderIcon;
  final bool? hideText;
  final void Function(String?)? onSave;
  final void Function(String?)? onChanged;
  final String? Function(String?)? onValidation;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isTextHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: FontTheme.subHeadingStyle.copyWith(
            color: Colors.black54,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black54, fontSize: 20),
          obscureText: widget.hideText == true ? _isTextHidden : false,
          autocorrect: false,
          onSaved: widget.onSave,
          validator: widget.onValidation,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            suffixIcon: widget.hideText ?? false
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isTextHidden = !_isTextHidden;
                      });
                    },
                    icon: _isTextHidden
                        ? Icon(PhosphorIcons.eye())
                        : Icon(PhosphorIcons.eyeSlash()),
                  )
                : null,
            // label: Row(
            //   children: [
            //     Icon(
            //       widget.placeholderIcon,
            //       // color: const Color.fromARGB(255, 253, 129, 59),
            //     ),
            //     const SizedBox(
            //       width: 8,
            //     ),
            //     // Text(widget.placeholderText),
            //   ],
            // ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(48),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
