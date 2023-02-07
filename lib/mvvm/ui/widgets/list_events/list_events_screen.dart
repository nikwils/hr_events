import 'package:flutter/material.dart';
import '../bottom_sheet_events.dart';
import '../drawer_events.dart';
import 'list_events_widget.dart';

class ListEventsScreen extends StatelessWidget {
  ListEventsScreen({super.key});

  static const routeName = '/list-hr-events';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Новости и события"),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            onPressed: () {
              BottomSheetEvents.show(context);
            },
            icon: const Icon(
              Icons.display_settings,
            ),
            key: const Key("settingsButton"),
          ),
        ],
      ),
      drawer: const DrawerEvents(),
      body: ListEvents(),
    );
  }
}
