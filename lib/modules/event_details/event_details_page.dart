import 'package:flutter/material.dart';
import 'package:split_it/modules/event_details/event_details_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.colors.backgroundPrimary,
        title: Text(
          widget.event.name,
          style: AppTheme.textStyles.appBarEventDetails,
        ),
        centerTitle: true,
        leading: BackButton(
          color: AppTheme.colors.backButton,
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.delete(widget.event.id);
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
                        ...widget.event.friends
                            .map((e) => PersonTileWidget(
                                  onPressed: () {},
                                  friend: e,
                                  value: widget.event.valueSplit,
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
                      ...widget.event.items
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
                  value: widget.event.value,
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
                    "Faltam ${widget.event.remainingValue.reais()}",
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
