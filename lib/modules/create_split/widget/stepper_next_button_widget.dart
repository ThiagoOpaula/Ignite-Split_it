import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepperNextNuttonWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool enabled;
  final bool colored;

  const StepperNextNuttonWidget(
      {Key? key,
      required this.label,
      required this.onTap,
      this.enabled = true,
      this.colored = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: Container(
          height: 60,
          child: Center(
            child: Text(label,
                style: enabled
                    ? colored
                        ? AppTheme.textStyles.stepperNextButton
                            .copyWith(color: AppTheme.colors.iconAdd)
                        : AppTheme.textStyles.stepperNextButtonDisabled
                    : AppTheme.textStyles.stepperNextButtonDisabled),
          ),
        ),
      ),
    );
  }
}
