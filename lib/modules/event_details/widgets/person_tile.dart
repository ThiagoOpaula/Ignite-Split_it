import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/modules/event_details/widgets/check_rounded_button.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/utils/formatters.dart';

class PersonTileWidget extends StatelessWidget {
  final bool isPaid;
  final VoidCallback onPressed;
  final double value;
  final FriendModel friend;
  const PersonTileWidget(
      {Key? key,
      this.isPaid = false,
      required this.onPressed,
      required this.friend,
      required this.value})
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
            image: friend.photoURL.isNotEmpty
                ? DecorationImage(
                    image: NetworkImage(friend.photoURL),
                    fit: BoxFit.cover,
                  )
                : null),
        child: friend.photoURL.isEmpty ? Text(friend.name[0]) : Container(),
      ),
      title: Text(
        friend.name,
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
            color: isPaid ? Color(0xFF40B28C) : Color(0XFF666666)),
      ),
      trailing: CheckRoundedButton(
        isClicked: isPaid,
        onPressed: onPressed,
      ),
    );
  }
}
