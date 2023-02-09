import 'package:hr/mvvm/domain/models/event_model.dart';

import '../data_providers/list_events_data_provider.dart';

class ListEventsService {
  final _listEventsDataProvider = ListEventsDataProvider();

  var _listEvents = [
    Event(
      id: 185,
      position: 0,
      name: 'Brain1 Club',
      type: 10,
      changeDT: 1673948546,
      announce: null,
      views: 94,
      dateStart: '',
      dateEnd: '',
      timeStart: '',
      timeEnd: '',
      youtube: null,
      address: null,
      location: null,
      longitude: '',
      latitude: '',
      instagram: null,
      email: [
        {"name": "Команда ГЦКА", "data": "sport_art@dme.ru"}
      ],
      url: [],
      phone: [],
      picture: 'https://events-backend.dme.ru//storage/image/?id=488',
    )
  ];
  List<Event> get listEvents => _listEventsDataProvider.listEventsGet;

  Future<void> initilalize() async {
    _listEvents = await _listEventsDataProvider.fetchListEvents();
  }
}
