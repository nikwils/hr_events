import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/event_model.dart';
import '../../../domain/services/list_events_service.dart';

class _ViewModelState {
  final String ageTitle;
  _ViewModelState({
    required this.ageTitle,
  });
}

class ListEventsViewModel extends ChangeNotifier {
  var _state = _ViewModelState(ageTitle: '');
  _ViewModelState get state => _state;
  final _listEventsService = ListEventsService();

  List<Event> get listEventsService => _listEventsService.listEvents;

  DateTime _today = DateTime.now();

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

  void loadValue() {
    _listEventsService.initilalize();
    for (var i = 0; i < listEventsService.length; i++) {
      print(listEventsService[i].id);
    }
    _updateState();
  }

  ListEventsViewModel() {
    loadValue();
  }

  void _updateState() {
    final event = _listEventsService.listEvents;
    print('event${event.length}');

    _state = _ViewModelState(
      ageTitle: event[0].id.toString(),
    );
    notifyListeners();
  }
}
