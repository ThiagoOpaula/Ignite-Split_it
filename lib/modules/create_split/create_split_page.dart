import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/one/step_one_page.dart';
import 'package:split_it/modules/create_split/steps/three/step_three_page.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_page.dart';
import 'package:split_it/modules/create_split/widget/bottom_stepper_bar_widget.dart';
import 'package:split_it/modules/create_split/widget/create_split_appbar_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(onChange: (name) {
        controller.setEventName(name);
        setState(() {});
      }),
      StepTwoPage(),
      StepThreePage(),
    ];
  }

  var index = 0;

  void nextPage() {
    if (index < 2) {
      index++;
      setState(() {});
    }
  }

  void backPage() {
    if (index > 0) {
      index--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: CreateSplitAppBarWidget(
        actualPage: index,
        size: pages.length,
        onTapBack: backPage,
      ),
      body: pages[index],
      bottomNavigationBar: BottomStepperBarWidget(
        onTapCancel: backPage,
        onTapNext: nextPage,
        enabledButtons: controller.enableNavigateButton(),
      ),
    );
  }
}