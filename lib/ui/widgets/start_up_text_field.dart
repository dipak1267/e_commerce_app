import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/app_layout.dart';
import 'package:portfolio_app/theme/styels.dart';

class StartupTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType type;
  final bool isPassword;
  final bool isHidden;
  final FormFieldValidator<String> validator;

  const StartupTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.type,
      this.isPassword = false,
      this.isHidden = false,
      required this.validator})
      : super(key: key);

  @override
  _StartupTextFieldState createState() => _StartupTextFieldState();
}

class _StartupTextFieldState extends State<StartupTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: textFieldLabelStyle(),
        border: startupTextFieldBorder(),
        filled: true,
        fillColor: const Color(0xFF1D1D1D),
        focusedBorder: startupTextFieldBorder(),
        enabledBorder: startupTextFieldBorder(),
        suffixIcon: Visibility(
          visible: widget.isPassword && !widget.isHidden,
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: Image.asset(
                showPassword
                    ? "assets/images/ic_password_invisibility.png"
                    : "assets/images/ic_password_visibility.png",
                width: 24,
                height: 24,
              ),
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
            ),
          ),
        ),
      ),
      style: $styles.text.defaultFont,
      cursorColor: Colors.white,
      keyboardType: widget.type,
      obscureText: !showPassword && widget.isPassword,
      validator: widget.validator,
    );
  }
}
