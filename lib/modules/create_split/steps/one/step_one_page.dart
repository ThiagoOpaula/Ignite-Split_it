import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/widget/step_input_text_widget.dart';
import 'package:split_it/modules/create_split/widget/step_title_widget.dart';

class StepOnePage extends StatefulWidget {
  final CreateSplitController controller;
  StepOnePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          title: "Qual o nome",
          subtitle: "\ndo evento?",
        ),
        StepInputTextWidget(
          hintText: "Ex: Churrasco",
          onChange: (value) {
            widget.controller.onChanged(name: value);
          },
        )
      ],
    );
  }
}
