import 'package:flutter/material.dart';
import 'package:hr/mvvm/ui/widgets/list_events/list_events_view_model.dart';
import 'package:provider/provider.dart';

import '../detail_event/detail_event_screen.dart';

class SubEventsScreen extends StatelessWidget {
  const SubEventsScreen({super.key});
  static const routeName = '/sub-events';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Подписки на события')),
      body: _ListSubEvents(),
    );
  }
}

class _ListSubEvents extends StatelessWidget {
  const _ListSubEvents({super.key});

  @override
  Widget build(BuildContext context) {
    var listEventsViewModel = context.read<ListEventsViewModel>();
    var subEvents = listEventsViewModel.subListEvents;

    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      itemCount: subEvents.length,
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
          onTap: () async {
            listEventsViewModel.setSelectedEvent(subEvents[i]);
            Navigator.of(context).pushNamed(DetailEventScreen.routeName);
          },
          child: Card(
            color: Colors.amber,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      subEvents[i].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    subEvents[i].dateEnd,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
