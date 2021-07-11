import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepInputTextWidget extends StatelessWidget {
  final void Function(String)? onChange;
  final String hintText;
  final TextAlign align;
  final EdgeInsets? padding;
  const StepInputTextWidget({
    Key? key,
    required this.onChange,
    required this.hintText,
    this.align = TextAlign.center,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 64),
          child: TextField(
            onChanged: onChange,
            textAlign: align,
            style: AppTheme.textStyles.textField,
            cursorColor: AppTheme.colors.backgroundSecondary,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTheme.textStyles.hintTextField,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.colors.inputBorder),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.colors.divider),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.colors.inputBorder),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
