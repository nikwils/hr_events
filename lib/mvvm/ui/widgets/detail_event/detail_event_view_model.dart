import 'package:flutter/material.dart';

import '../../../domain/models/event_model.dart';

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
                    Text(selectedEvent.email.isNotEmpty
                        ? selectedEvent.email[0].toString()
                        : 'почты нет'),
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
