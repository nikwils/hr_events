import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/event_model.dart';
import '../../../domain/services/list_events_service.dart';

class ListEventsViewModel extends ChangeNotifier {
  DateTime _today = DateTime.now();
  Future? future;

  final _listEventsService = ListEventsService();

  List<Event> get listEventsService => updateListEvents();

  Future<void> loadValue() async {
    await _listEventsService.initilalize();
    notifyListeners();
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
    print('text: ${controllerSearch.text}');
    print('я тут');
  }

  void clearTextField() {
    // Clear everything in the text field
    controllerSearch.clear();
    // Call setState to update the UI
    notifyListeners();
  }

  ListEventsViewModel() {
    future = loadValue();
    updateListEvents();
    print(('ListEventsViewModel ${listEventsService.length}'));
  }

  List<Event> updateListEvents() {
    return _listEventsService.listEvents;
  }
}
