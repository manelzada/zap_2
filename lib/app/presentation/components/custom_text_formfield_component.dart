import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormFieldComponent extends StatelessWidget {
  final String label;
  final String? error;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final bool enabled;
  final bool obscureText;
  final void Function(String)? onChange;
  final IconButton? suffixIcon;
  final List<TextInputFormatter> inputFormatters;

  const CustomTextFormFieldComponent(
      {Key? key,
      required this.label,
      this.textEditingController,
      required this.textInputType,
      this.focusNode,
      this.enabled = true,
      this.onChange,
      this.error,
      this.obscureText = false,
      this.inputFormatters = const [],
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      onChanged: onChange,
      obscureText: obscureText,
      focusNode: focusNode,
      keyboardType: textInputType,
      controller: textEditingController,
      inputFormatters: inputFormatters,
      style: TextStyle(
          color: Colors.white, fontFamily: GoogleFonts.balooBhai2().fontFamily),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.grey, width: 0.0),
        ),
        filled: true,
        fillColor: const Color(0xFF171E26),
        suffixIcon: suffixIcon,
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        errorText: error,
      ),
    );
  }
}
