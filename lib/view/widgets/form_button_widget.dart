import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final BoxBorder? border;
  final double? width;
  final double? height;

  const FormButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.border,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.0,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(20.0),
        color: onPressed == null
            ? backgroundColor?.withOpacity(0.5) ?? const Color(0xFF2B637B)
            : backgroundColor ?? const Color(0xFF2B637B),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
