import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_state.dart';
import 'package:split_it/modules/home/widgets/info_card_widget.dart';

class BottomAppBarWidget extends StatefulWidget {
  BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  final controller = AppBarController();

  @override
  void initState() {
    controller.getDashboard();
    controller.listen((state) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (controller.state.runtimeType) {
      case AppBarStateLoading:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCardWidget(
                value: 0,
                isLoading: true,
              ),
              InfoCardWidget(
                value: -0,
                isLoading: true,
              ),
            ],
          );
        }
      case AppBarStateSucess:
        {
          final dashboard = (controller.state as AppBarStateSucess).dashboard;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCardWidget(
                value: dashboard.receive,
                isLoading: false,
              ),
              InfoCardWidget(
                value: -dashboard.send,
                isLoading: false,
              ),
            ],
          );
        }
      case AppBarStateLoading:
        {
          final message = (controller.state as AppBarStateFailure).message;
          return Text(message);
        }
      default:
        {
          return Container();
        }
    }
  }
}
