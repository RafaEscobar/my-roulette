import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.label,
    required this.callBack,
    required this.btnColor,
    this.textColor,
    this.padding = EdgeInsets.zero,
    this.width = 100,
    this.textStyle,
    this.icon,
  });
  final String label;
  final Function() callBack;
  final Color btnColor;
  final Color? textColor;
  final IconData? icon;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6,
          children: [
            if(icon!=null) Icon(icon, size: 26, color: textColor ?? Colors.purple.shade700,),
            Text(label, style: textStyle ?? TextStyle(fontSize: 18, color:  textColor),)
          ],
        ),
      ),
    );
  }
}