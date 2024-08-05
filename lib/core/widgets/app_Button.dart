import 'package:flutter/material.dart';

class PublicButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle textStyle;
  final double width;
  final double height;
  final double borderRadius;
  final BorderSide? side;
  final Widget? icon;

  PublicButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textStyle,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.side,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: icon!,
              label: Text(
                text,
                style: textStyle,
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: textStyle,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
    );
  }
}
