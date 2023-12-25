import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, 
      required this.hint, 
      this.maxLine = 1, 
      this.saved, 
      this.change});
  
  final String hint;
  final int maxLine;
  final void Function(String?)? saved;
  final Function(String)? change;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'The field is required';
        } else {
          return null;
        }
      },
      onSaved: saved,
      onChanged: change,
      cursorColor: kPrimaryColor,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white));
  }
}
