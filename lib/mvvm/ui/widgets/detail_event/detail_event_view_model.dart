import 'package:flutter/material.dart';

import '../../../domain/models/event_model.dart';
import '../list_events/list_events_view_model.dart';

class DetailEventViewModel extends ChangeNotifier {
  void switcher(value) {
    print('switcher $value');
  }

  void show(BuildContext ctx, Event selectedEvent) {
    showModalBottomSheet(
      elevation: 1,
      backgroundColor: Colors.white,
      context: ctx,
      builder: (ctx) => SizedBox(
        height: 60,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text("По всем вопросам"),
              onTap: () {
                print("Copy");
              },
              trailing: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(selectedEvent.email[0].toString()),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
