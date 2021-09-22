import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/create_split_status.dart';
import 'package:split_it/modules/create_split/steps/one/step_one_page.dart';
import 'package:split_it/modules/create_split/steps/three/step_three_page.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_page.dart';
import 'package:split_it/modules/create_split/widget/bottom_stepper_bar_widget.dart';
import 'package:split_it/modules/create_split/widget/create_split_appbar_widget.dart';
import 'package:split_it/modules/create_split_sucess/create_split_sucess_page.dart';
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
  late ReactionDisposer _disposer;

  @override
  void initState() {
    pages = [
      StepOnePage(controller: controller),
      StepTwoPage(controller: controller),
      StepThreePage(createController: controller),
    ];
    _disposer = autorun((_) {
      if (controller.status == CreateSplitStatus.success) {
        BotToast.closeAllLoading();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CreateSplitSucessPage(controller: controller),
          ),
        );
      } else if (controller.status == CreateSplitStatus.loading) {
        BotToast.showLoading();
      } else if (controller.status == CreateSplitStatus.error) {
        BotToast.closeAllLoading();
        BotToast.showText(text: "Não foi possível cadastrar esse evento");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  bool backNavigate() {
    if (controller.currentPage == 0) {
      Navigator.pop(context);
      return true;
    } else {
      controller.backPage();
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => backNavigate(),
      child: Scaffold(
        backgroundColor: AppTheme.colors.backgroundPrimary,
        appBar: CreateSplitAppBarWidget(
          controller: controller,
          onTapBack: () {
            backNavigate();
          },
          size: pages.length,
        ),
        body: Observer(builder: (_) {
          final index = controller.currentPage;
          return pages[index];
        }),
        bottomNavigationBar: BottomStepperBarWidget(
          controller: controller,
        ),
      ),
    );
  }
}
