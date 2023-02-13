import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_events/list_events_screen.dart';
import 'list_events/list_events_view_model.dart';
import 'sub_events/sub_events_screen.dart';

class DrawerEvents extends StatelessWidget {
  const DrawerEvents({super.key});

  @override
  Widget build(BuildContext context) {
    final listEventsViewModel = context.watch<ListEventsViewModel>();

    return Drawer(
      backgroundColor: const Color.fromRGBO(41, 99, 113, 1),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 30, 8, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  onTap: () => Navigator.of(context)
                      .popAndPushNamed(ListEventsScreen.routeName),
                  leading: const Icon(Icons.calendar_today_outlined),
                  title: const Text(
                    'Лента cобытий',
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
                ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  onTap: () async {
                    listEventsViewModel.setSubListEvents();
                    Navigator.of(context)
                        .popAndPushNamed(SubEventsScreen.routeName);
                  },
                  leading: const Icon(Icons.notifications),
                  title: const Text('Мои подписки'),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
              ],
            ),
            Image.asset(
              'assets/imgs/dme_icon.jpg',
              width: 30,
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
