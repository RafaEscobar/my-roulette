import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({super.key, required this.label, required this.callBack, required this.btnColor, required this.textColor, this.icon});
  final String label;
  final Function() callBack;
  final Color btnColor;
  final Color textColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        height: 50,
        width: 210,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6,
          children: [
            if(icon!=null) Icon(icon, size: 26, color: textColor,),
            Text(label, style: TextStyle(fontSize: 18, color: textColor),)
          ],
        ),
      ),
    );
  }
}