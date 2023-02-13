import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../list_events/list_events_view_model.dart';
import 'detail_event_widget.dart';

class DetailEventScreen extends StatelessWidget {
  DetailEventScreen({super.key});
  static const routeName = '/detail-event';

  @override
  Widget build(BuildContext context) {
    final selectedEvent = context.watch<ListEventsViewModel>().selectedEvent;

    return Scaffold(
        appBar: AppBar(title: Text(selectedEvent.name)),
        body: SafeArea(child: DetailEvent(selectedEvent)));
  }
}
