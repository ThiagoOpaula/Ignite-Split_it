import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_controller.dart';
import 'package:split_it/modules/create_split/widget/person_tile_widget.dart';
import 'package:split_it/modules/create_split/widget/step_input_text_widget.dart';
import 'package:split_it/modules/create_split/widget/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  final CreateSplitController controller;
  StepTwoPage({Key? key, required this.controller}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  late StepTwoController controller;

  @override
  void initState() {
    controller = StepTwoController(controller: widget.controller);
    controller.getFriends();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          title: "Com quem",
          subtitle: "\nvocê quer dividir",
        ),
        StepInputTextWidget(
            onChange: (value) {
              controller.onChange(value);
            },
            hintText: "Nome da pessoa"),
        SizedBox(height: 35),
        Observer(builder: (_) {
          if (controller.selectedFriends.isEmpty) {
            return Container();
          } else {
            return Column(children: [
              ...controller.selectedFriends
                  .map((friend) => PersonTile(
                        data: friend,
                        isRemoved: true,
                        onPressed: () {
                          controller.removeFriend(friend);
                        },
                      ))
                  .toList(),
              SizedBox(
                height: 16,
              )
            ]);
          }
        }),
        Observer(builder: (_) {
          if (controller.items.isEmpty) {
            return Text("Nenhum amigo encontrado");
          } else {
            return Column(
              children: controller.items
                  .map((friend) => PersonTile(
                        data: friend,
                        onPressed: () {
                          controller.addFriend(friend);
                        },
                      ))
                  .toList(),
            );
          }
        }),
      ],
    );
  }
}
