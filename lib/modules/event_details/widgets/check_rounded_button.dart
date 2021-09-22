import 'package:flutter/material.dart';

class CheckRoundedButton extends StatelessWidget {
  final bool isClicked;
  final VoidCallback onPressed;
  const CheckRoundedButton({
    Key? key,
    this.isClicked = false,
    required this.onPressed,
  }) : super(key: key);

  Color get backgroundColor => isClicked
      ? Color(0xFF40B28C).withOpacity(0.16)
      : Color(0xFFFF455250).withOpacity(0.08);
  Color get centerColor => isClicked ? Color(0xFF40B28C) : Colors.white;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: centerColor,
            ),
            child: Center(
              child: isClicked
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.fromBorderSide(
                              BorderSide(color: Color(0xFFC0CCC9), width: 2))),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
