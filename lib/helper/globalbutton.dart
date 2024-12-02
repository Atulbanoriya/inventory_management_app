import 'package:flutter/material.dart';
import 'package:inventory_management_system/helper/App_fonts.dart';

class GlobalButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final double? height;
  final double? width;

  const GlobalButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.color,
    this.textStyle,
    this.padding,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: textStyle ??
                TextStyle(
                  fontSize: h * 0.02,
                  color: Colors.black,
                  fontFamily: FontHelper.buttonFont,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
