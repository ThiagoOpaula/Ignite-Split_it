import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/event_details/event_details_controller.dart';
import 'package:split_it/modules/event_details/event_details_status.dart';
import 'package:split_it/modules/event_details/widgets/item_tile.dart';
import 'package:split_it/modules/event_details/widgets/person_tile.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/shared/utils/formatters.dart';
import 'package:split_it/theme/app_theme.dart';

class EventDetailsPage extends StatefulWidget {
  final EventModel event;
  EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final controller = EventDetailsController(
    repository: FirebaseRepository(),
  );
  late ReactionDisposer _disposer;
  late EventModel event;

  @override
  void initState() {
    event = widget.event;
    _disposer = autorun((_) {
      if (controller.status.runtimeType == EventDetailsStatusSucess) {
        BotToast.closeAllLoading();
        Navigator.pop(context);
      } else if (controller.status.runtimeType == EventDetailsStatusLoading) {
        BotToast.showLoading();
      } else if (controller.status.runtimeType == EventDetailsStatusFailure) {
        BotToast.closeAllLoading();
        BotToast.showText(text: "Não foi possível deletar o evento");
      }
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.colors.backgroundPrimary,
        title: Text(
          event.name,
          style: AppTheme.textStyles.appBarEventDetails,
        ),
        centerTitle: true,
        leading: BackButton(
          color: AppTheme.colors.backButton,
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.delete(event.id);
              },
              icon: Icon(
                Icons.delete,
                color: AppTheme.colors.backButton,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFF455250).withOpacity(0.08),
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("INTEGRANTES",
                            style: AppTheme.textStyles.eventDetailTitle),
                        ...event.friends
                            .map((e) => PersonTileWidget(
                                  key: UniqueKey(),
                                  event: event,
                                  model: e,
                                  value: event.valueSplit,
                                  onChanged: (newEvent) {
                                    event = newEvent;
                                    setState(() {});
                                  },
                                ))
                            .toList()
                      ],
                    ),
                  )),
            ),
            Container(
              color: Color(0xFF455250).withOpacity(0.08),
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ÍTENS",
                          style: AppTheme.textStyles.eventDetailTitle),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 1,
                        indent: 0,
                        height: 1,
                      ),
                      ...event.items
                          .map((e) => ItemTileWidget(
                                name: e.name,
                                value: e.value,
                              ))
                          .toList()
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Color(0xFF455250).withOpacity(0.08),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ItemTileWidget(
                  name: "total",
                  value: event.value,
                  hasDivider: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Faltam ${event.remainingValue.reais()}",
                    style: AppTheme.textStyles.eventDetailTitle
                        .copyWith(color: Color(0XFFE83F5B)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
