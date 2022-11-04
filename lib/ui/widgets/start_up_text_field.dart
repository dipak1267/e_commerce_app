import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/app_layout.dart';
import 'package:portfolio_app/theme/styels.dart';
import 'package:portfolio_app/utils/app_extention.dart';

class StartupTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType type;
  final bool isPassword;
  final Widget? prefixIcon;
  final bool isHidden;
  final FormFieldValidator<String> validator;

  const StartupTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.type,
      this.isPassword = false,
      this.isHidden = false,
      this.prefixIcon,
      required this.validator})
      : super(key: key);

  @override
  _StartupTextFieldState createState() => _StartupTextFieldState();
}

class _StartupTextFieldState extends State<StartupTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label.appBodySmallText(),
        (5.0).addHSpace(),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.label,
            hintStyle: textFieldLabelStyle(),
            border: startupTextFieldBorder(),
            filled: false,
            fillColor: const Color(0xFF1D1D1D),
            focusedBorder: startupTextFieldBorder(),
            enabledBorder: startupTextFieldBorder(),
            prefixIcon: IconButton(
              onPressed: null,
              icon: widget.prefixIcon ?? Container(),
            ),
            suffixIcon: Visibility(
              visible: widget.isPassword && !widget.isHidden,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(
                    showPassword
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                    color: Colors.white,
                    size: 24,
                    // height: 24,
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
          style: $styles.text.defaultFont.copyWith(color: $styles.colors.white),
          cursorColor: Colors.white,
          keyboardType: widget.type,
          obscureText: !showPassword && widget.isPassword,
          validator: widget.validator,
        ),
      ],
    );
  }
}
