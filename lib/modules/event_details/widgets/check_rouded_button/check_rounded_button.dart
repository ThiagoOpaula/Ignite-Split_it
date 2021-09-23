import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/event_details/widgets/check_rouded_button/check_rounded_controller.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

class CheckRoundedButton extends StatefulWidget {
  final EventModel event;
  final FriendModel friend;
  final Function(EventModel newEvent) onChanged;
  const CheckRoundedButton({
    Key? key,
    required this.event,
    required this.friend,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CheckRoundedButton> createState() => _CheckRoundedButtonState();
}

class _CheckRoundedButtonState extends State<CheckRoundedButton> {
  late CheckRoundedController controller;

  Color get backgroundColor =>
      widget.friend.isPaid || controller.status == CheckRoundedStatus.sucess
          ? Color(0xFF40B28C).withOpacity(0.16)
          : Color(0xFFFF455250).withOpacity(0.08);

  Color get centerColor =>
      widget.friend.isPaid || controller.status == CheckRoundedStatus.sucess
          ? Color(0xFF40B28C)
          : Colors.white;

  @override
  void initState() {
    controller = CheckRoundedController(
      repository: FirebaseRepository(),
      event: widget.event,
    );
    if (widget.friend.isPaid) {
      controller.status = (CheckRoundedStatus.sucess);
    }
    autorun((_) {
      if (controller.status == CheckRoundedStatus.sucess ||
          controller.status == CheckRoundedStatus.empty) {
        widget.onChanged(controller.event);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => InkWell(
        onTap: () {
          controller.update(widget.friend);
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: centerColor,
              ),
              child: Center(
                child: controller.status == CheckRoundedStatus.sucess
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.fromBorderSide(BorderSide(
                                color: Color(0xFFC0CCC9), width: 2))),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
