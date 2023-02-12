import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/data_providers/list_events_data_provider.dart';
import '../../../domain/models/event_model.dart';
import '../../../domain/services/list_events_service.dart';

class ListEventsViewModel extends ChangeNotifier {
  DateTime _today = DateTime.now();
  Future? future;

  late Event _selectedEvent;

  final _listEventsService = ListEventsService();
  List<Event> get listEvents => _listEventsService.listEvents;
  Event get selectedEvent => _selectedEvent;

  setSelectedEvent(Event event) {
    _selectedEvent = event;
  }

  ListEventsViewModel() {
    future = _listEventsService.initilalize();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 7)),
      initialDate: _today,
      lastDate: _today,
    );
    if (picked != null) {
      controllerSearch.text = DateFormat.yMMMMd('ru').format(picked).toString();
      notifyListeners();
    }
  }

  final TextEditingController controllerSearch = TextEditingController();

  void printLatestValue() {
    print('printLatestValue: ${controllerSearch.text}');
  }

  void clearTextField() {
    // Clear everything in the text field
    controllerSearch.clear();
    // Call setState to update the UI
    notifyListeners();
  }
}
