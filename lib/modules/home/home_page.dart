import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/app_bar_widget.dart';
import 'package:split_it/modules/home/widgets/info_card_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';

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
      backgroundColor: Colors.grey,
      appBar: AppBarWidget(
        user: user,
        onTapAddButton: () {
          print('funfou2');
        },
      ),
      body: Row(
        children: [],
      ),
    );
  }
}
