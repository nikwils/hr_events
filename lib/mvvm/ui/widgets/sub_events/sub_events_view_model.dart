import 'package:flutter/material.dart';

import '../../../domain/models/event_model.dart';
import '../list_events/list_events_view_model.dart';

class SubEventsViewModel extends ChangeNotifier {
  final _listEventsService = ListEventsViewModel().listEventsService;

  late List<Event> _subEvents;
  List<Event> get subEvents =>
      _listEventsService.where((element) => element.id != 0).toList();
}
