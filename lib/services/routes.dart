import 'package:flutter/material.dart';

import '../mvvm/detail_event/detail_event_screen.dart';
import '../mvvm/list_events/list_events_screen.dart';
import '../mvvm/sub_events/sub_events_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routesMap = {
    ListEventsScreen.routeName: ((ctx) => ListEventsScreen()),
    SubEventsScreen.routeName: ((ctx) => SubEventsScreen()),
    DetailEventScreen.routeName: ((ctx) => DetailEventScreen()),
  };
}
