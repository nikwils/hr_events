import 'package:flutter/material.dart';

import 'mvvm/detail_event/detail_event_screen.dart';
import 'mvvm/list_events/list_events_screen.dart';
import 'mvvm/sub_events/sub_events_screen.dart';
import 'services/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'AvenirNext',
          primaryColor: Color.fromRGBO(70, 218, 218, 1.0),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color.fromRGBO(70, 218, 218, 1.0),
          )),
      home: ListEventsScreen(),
      routes: Routes.routesMap,
    );
  }
}
