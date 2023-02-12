import 'package:flutter/material.dart';

import '../../../domain/models/event_model.dart';
import '../list_events/list_events_view_model.dart';

class SubEventsViewModel extends ChangeNotifier {
  final _listEvents = ListEventsViewModel().listEvents;

  late List<Event> _subEvents;
  List<Event> get subEvents =>
      _listEvents.where((element) => element.id != 0).toList();
}
