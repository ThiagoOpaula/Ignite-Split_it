import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widget/person_tile_widget.dart';
import 'package:split_it/modules/create_split/widget/step_input_text_widget.dart';
import 'package:split_it/modules/create_split/widget/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  StepTwoPage({Key? key}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          title: "Com quem",
          subtitle: "\nvocê quer dividir",
        ),
        StepInputTextWidget(onChange: (value) {}, hintText: "Nome da pessoa"),
        SizedBox(height: 35),
        PersonTileWidget(
          name: "Gabul Dev",
        ),
        PersonTileWidget(
          name: "Thiago Dev",
        ),
        PersonTileWidget(
          name: "teste Dev",
        ),
      ],
    );
  }
}
