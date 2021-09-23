import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/modules/event_details/widgets/check_rouded_button/check_rounded_button.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/utils/formatters.dart';

class PersonTileWidget extends StatelessWidget {
  final FriendModel model;
  final double value;
  final Function(EventModel newFriend) onChanged;
  final EventModel event;
  const PersonTileWidget(
      {Key? key,
      required this.onChanged,
      required this.model,
      required this.value,
      required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: model.photoURL.isNotEmpty
                ? DecorationImage(
                    image: NetworkImage(model.photoURL),
                    fit: BoxFit.cover,
                  )
                : null),
        child: model.photoURL.isEmpty ? Text(model.name[0]) : Container(),
      ),
      title: Text(
        model.name,
        style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0XFF666666)),
      ),
      subtitle: Text(
        value.reais(),
        style: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: model.isPaid ? Color(0xFF40B28C) : Color(0XFFE83F5B)),
      ),
      trailing: CheckRoundedButton(
        event: event,
        friend: model,
        onChanged: onChanged,
      ),
    );
  }
}
