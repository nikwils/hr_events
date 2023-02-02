import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../sub_events/sub_events_screen.dart';
import 'list_events_widget.dart';

void _show(BuildContext ctx) {
  showModalBottomSheet(
    elevation: 1,
    backgroundColor: Colors.white,
    context: ctx,
    builder: (ctx) => Container(
      padding: EdgeInsets.all(8),
      width: 300,
      height: 150,
      color: Colors.white54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text("Новости и события",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text("Новости"),
          Text("Cобытия"),
          Divider(
            color: Color.fromARGB(255, 193, 192, 192),
            thickness: 1,
            height: 2,
            indent: 0,
          ),
          Text("Отмена"),
        ],
      ),
    ),
  );
}

class ListEventsScreen extends StatelessWidget {
  ListEventsScreen({super.key});

  static const routeName = '/list-hr-events';

  bool _showBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Новости и события"),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            onPressed: () {
              print("settings");
              _show(context);
            },
            icon: const Icon(
              Icons.display_settings,
            ),
            key: Key("settingsButton"),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(41, 99, 113, 1),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 30, 8, 8),
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
                    leading: Icon(Icons.calendar_today_outlined),
                    title: Text(
                      'Лента cобытий',
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded),
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    onTap: () => Navigator.of(context)
                        .popAndPushNamed(SubEventsScreen.routeName),
                    leading: Icon(Icons.notifications),
                    title: Text('Мои подписки'),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded),
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
      ),
      body: HrList(),
    );
  }
}
