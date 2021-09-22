import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/three/step_three_controller.dart';
import 'package:split_it/modules/create_split/widget/add_text_button.dart';
import 'package:split_it/modules/create_split/widget/step_multi_input_text.dart';
import 'package:split_it/modules/create_split/widget/step_title_widget.dart';

class StepThreePage extends StatefulWidget {
  final CreateSplitController createController;
  StepThreePage({Key? key, required this.createController}) : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  final controller = StepThrreController();
  late ReactionDisposer _disposer;

  @override
  void initState() {
    _disposer = autorun((_) {
      widget.createController.onChanged(items: controller.items.toList());
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StepTitleWidget(
            title: "Qual ou quais",
            subtitle: "\nítens você quer dividir?",
          ),
          Observer(
            builder: (_) => StepMultiInputText(
              key: UniqueKey(),
              count: controller.currentIndex,
              itemName: (value) {
                controller.onChanged(name: value);
              },
              itemValue: (value) {
                controller.onChanged(value: value);
              },
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Observer(
              builder: (_) => controller.ShowButton
                  ? AddTextButton(
                      label: "Continuar",
                      onPressed: () {
                        controller.addItem();
                      })
                  : Container()),
          SizedBox(
            height: 24,
          ),
          Observer(
            builder: (_) => Column(children: [
              for (var i = 0; i < controller.items.length; ++i)
                StepMultiInputText(
                  key: Key(controller.items[i].hashCode.toString()),
                  isRemoved: true,
                  initialName: controller.items[i].name,
                  initialValue: controller.items[i].value,
                  count: i + 1,
                  itemName: (value) {
                    controller.editItem(i, name: value);
                  },
                  itemValue: (value) {
                    controller.editItem(i, value: value);
                  },
                  onDelete: () {
                    controller.removeItem(i);
                  },
                ),
            ]),
          ),
        ],
      ),
    );
  }
}
