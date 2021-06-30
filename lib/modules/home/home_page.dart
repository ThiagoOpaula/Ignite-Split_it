import 'package:flutter/material.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_widget.dart';
import 'package:split_it/modules/home/widgets/event_tile_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getEvents();
    controller.listen((state) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: AppBarWidget(
        user: user,
        onTapAddButton: () {
          print('funfou2');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (controller.state is HomeStateLoading) ...[
                CircularProgressIndicator(),
              ] else if (controller.state is HomeStateSucess) ...[
                ...(controller.state as HomeStateSucess)
                    .events
                    .map(
                      (e) => EventTileWidget(model: e),
                    )
                    .toList()
              ] else if (controller.state is HomeStateFailure) ...[
                Text((controller.state as HomeStateFailure).message)
              ] else
                ...[Container()].toList()
            ],
          ),
        ),
      ),
    );
  }
}
