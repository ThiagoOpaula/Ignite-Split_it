import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widget/stepper_next_button_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapCancel;
  final VoidCallback onTapNext;
  final bool enabledButtons;

  const BottomStepperBarWidget(
      {Key? key,
      required this.onTapCancel,
      required this.onTapNext,
      this.enabledButtons = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Column(
        children: [
          Row(
            children: [
              StepperNextNuttonWidget(
                label: 'Cancelar',
                enabled: enabledButtons,
                onTap: enabledButtons ? onTapCancel : null,
              ),
              Container(
                width: 1,
                height: 60,
                color: AppTheme.colors.divider,
              ),
              StepperNextNuttonWidget(
                  label: 'Continuar',
                  enabled: enabledButtons,
                  onTap: enabledButtons ? onTapNext : null),
            ],
          ),
        ],
      ),
    );
  }
}
