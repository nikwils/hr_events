import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/event_model.dart';
import '../../../domain/services/list_events_service.dart';

class DetailEventViewModel extends ChangeNotifier {
  // я делаю копию _listEventsService, из-за чего он создаетя заново со старыми значениями
  final _listEventsService = ListEventsService();

  late Event _selectedEvent;
  Event get selectedEvent => _selectedEvent;
  bool _switchValue = false;

  Event findById(id) {
    for (var i = 0; i < _listEventsService.listEvents.length; i++) {
      print('id${_listEventsService.listEvents[i].id}');
    }
    return _listEventsService.listEvents.firstWhere((event) => event.id == id);
  }

  void loadValue() {
    _listEventsService.initilalize();
  }

  DetailEventViewModel() {
    loadValue();
  }

  bool switcher() {
    _switchValue = !_switchValue;
    notifyListeners();
    return _switchValue;
  }
}
