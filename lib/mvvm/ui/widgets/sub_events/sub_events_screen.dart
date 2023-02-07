import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../detail_event/detail_event_screen.dart';

class SubEventsScreen extends StatelessWidget {
  const SubEventsScreen({super.key});
  static const routeName = '/sub-events';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Подписки на события')),
      body: const _ListSubEvents(),
    );
  }
}

class _ListSubEvents extends StatelessWidget {
  const _ListSubEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(DetailEventScreen.routeName);
          },
          child: Card(
            color: Colors.amber,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              height: 75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Турник в DME по шахматам',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '19 ноября',
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
