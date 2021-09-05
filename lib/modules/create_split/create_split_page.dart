import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/four/step_four.dart';
import 'package:split_it/modules/create_split/steps/one/step_one_page.dart';
import 'package:split_it/modules/create_split/steps/three/step_three_page.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_page.dart';
import 'package:split_it/modules/create_split/widget/bottom_stepper_bar_widget.dart';
import 'package:split_it/modules/create_split/widget/create_split_appbar_widget.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController(repository: FirebaseRepository());

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(controller: controller),
      StepTwoPage(controller: controller),
      StepThreePage(createController: controller),
      StepFourPage(controller: controller),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: CreateSplitAppBarWidget(
        controller: controller,
        onTapBack: controller.backPage,
        size: pages.length,
      ),
      body: Observer(builder: (_) {
        final index = controller.currentPage;
        return pages[index];
      }),
      bottomNavigationBar: BottomStepperBarWidget(
        controller: controller,
        onTapCancel: () {},
      ),
    );
  }
}
