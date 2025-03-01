import 'package:flutter/material.dart';

class CustomButtonTow extends StatelessWidget {
  final Widget title;
  final BorderRadius? radius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final VoidCallback? onTap;
  final TextStyle? style;
  final BoxBorder? border;

  const CustomButtonTow({
    super.key,
    required this.title,
    this.radius,
    this.padding,
    this.color,
    this.onTap, this.style, this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color ?? Colors.blue,
          borderRadius: radius ?? BorderRadius.circular(11),
          border: border,
        ),
        child: Center(
          child:
            title,


        ),
      ),
    );
  }
}
