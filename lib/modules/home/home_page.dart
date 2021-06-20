import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/app_bar_widget.dart';
import 'package:split_it/modules/home/widgets/event_tile_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Column(
        children: [
          EventTileWidget(
            title: "Churrasco",
            subtitle: "05 de maio",
            value: 100,
            people: 2,
          ),
          EventTileWidget(
            title: "Churrasco",
            subtitle: "05 de maio",
            value: 100,
            people: 1,
          )
        ],
      ),
    );
  }
}
