import 'dart:async';

import 'package:flutter/material.dart';

import '../models/event_model.dart';

List<Event> _mockData = [
  Event(
      changeDT: 1,
      dateEnd: '1',
      dateStart: '9:00',
      email: [],
      id: 1,
      name: 'First1',
      phone: [],
      url: ['assets/imgs/default_img_card.png']),
  Event(
    changeDT: 2,
    dateEnd: '2',
    dateStart: '10:00',
    email: [],
    id: 2,
    name: 'Second',
    phone: [],
    url: ['assets/imgs/default_img_card.png'],
  ),
  Event(
    changeDT: 3,
    dateEnd: '3',
    dateStart: '10:00',
    email: [],
    id: 3,
    name: 'Third',
    phone: [],
    url: ['assets/imgs/default_img_card.png'],
  )
];

class ListEventsDataProvider {
  late List<Event> _listEvents;
  List<Event> get listEvents => _listEvents;

  List<Event> fetchListEvents() {
    _listEvents = _mockData;
    return _listEvents;
  }
}
