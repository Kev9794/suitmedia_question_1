import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? icon;
  final FloatingLabelBehavior? floatingLabelBehavior;

  const FormInput({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.validator,
    this.icon,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          errorStyle: TextStyle(fontSize: 10, color: Colors.orange.shade700)),
    );
  }
}
