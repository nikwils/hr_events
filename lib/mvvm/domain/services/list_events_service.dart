import 'package:hr/mvvm/domain/models/event_model.dart';

import '../data_providers/list_events_data_provider.dart';

class ListEventsService {
  List<Event> _listEvents = [];

  final _listEventsDataProvider = ListEventsDataProvider();
  List<Event> get listEvents => _listEvents;

  setEventsListModel(List<Event> listEvents) {
    _listEvents = listEvents;
  }

  initilalize() async {
    var response = await _listEventsDataProvider.fetchListEvents();
    if (response.isNotEmpty) {
      setEventsListModel(response);
    } else {
      print('Error');
    }
  }
}
