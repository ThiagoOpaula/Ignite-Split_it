import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/event_details/event_details_page.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/repositories/home_repository_firebase.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_widget.dart';
import 'package:split_it/modules/home/widgets/event_tile_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(repository: HomeRepositoryFirabase());

  @override
  void initState() {
    controller.getEvents();
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
        onTapAddButton: () async {
          await Navigator.pushNamed(context, "/create_split");
          controller.getEvents();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Observer(builder: (context) {
                if (controller.state is HomeStateLoading) {
                  return Column(
                    children: List.generate(
                        2,
                        (index) => EventTileWidget(
                            isLoading: true, model: EventModel())),
                  );
                } else if (controller.state is HomeStateSucess) {
                  return Column(
                    children: (controller.state as HomeStateSucess)
                        .events
                        .map(
                          (e) => EventTileWidget(
                            model: e,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EventDetailsPage(
                                    event: e,
                                  ),
                                ),
                              );
                              controller.getEvents();
                            },
                          ),
                        )
                        .toList(),
                  );
                } else if (controller.state is HomeStateFailure) {
                  return Text((controller.state as HomeStateFailure).message);
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
