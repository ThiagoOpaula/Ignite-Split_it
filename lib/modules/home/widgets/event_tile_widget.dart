import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/icon_dollar_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class EventTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final double value;
  final int people;
  const EventTileWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.people})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconDollarWidget(type: IconDollarType.receive),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    title,
                    style: AppTheme.textStyles.eventTileTitle,
                  ),
                  subtitle: Text(
                    subtitle,
                    style: AppTheme.textStyles.eventTileSubtitle,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "R\$ $value",
                        style: AppTheme.textStyles.eventTileMoney,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "$people pessoa${people == 1 ? '' : 's'}",
                        style: AppTheme.textStyles.eventTilePeople,
                      )
                    ],
                  ),
                ),
                Divider(
                  color: AppTheme.colors.divider,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
