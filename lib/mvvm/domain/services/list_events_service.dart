import 'package:hr/mvvm/domain/models/event_model.dart';

import '../data_providers/list_events_data_provider.dart';

class ListEventsService {
  final _listEventsDataProvider = ListEventsDataProvider();
  var _listEvents = [
    Event(
      changeDT: 1,
      dateEnd: '1',
      dateStart: '9:00',
      email: [],
      id: 1,
      name: 'First1',
      phone: [],
      url: ['assets/imgs/default_img_card.png'],
    )
  ];
  List<Event> get listEvents => _listEvents;

  void initilalize() {
    _listEvents = _listEventsDataProvider.fetchListEvents();
  }

  ListEventsService() {
    initilalize();
  }
}
