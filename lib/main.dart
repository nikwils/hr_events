import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hr/mvvm/ui/widgets/detail_event/detail_event_screen.dart';
import 'package:hr/mvvm/ui/widgets/detail_event/detail_event_view_model.dart';
import 'package:provider/provider.dart';

import 'mvvm/ui/widgets/list_events/list_events_screen.dart';
import 'mvvm/ui/widgets/list_events/list_events_view_model.dart';
import 'mvvm/ui/widgets/routes.dart';
import 'mvvm/ui/widgets/sub_events/sub_events_screen.dart';
import 'mvvm/ui/widgets/sub_events/sub_events_view_model.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DetailEventViewModel(),
          child: DetailEventScreen(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListEventsViewModel(),
          child: ListEventsScreen(),
        ),
        ChangeNotifierProvider(
          create: (_) => SubEventsViewModel(),
          child: SubEventsScreen(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          //вынести в файл
          Locale('ru', ''),
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'AvenirNext',
            primaryColor: const Color.fromRGBO(70, 218, 218, 1.0),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color.fromRGBO(70, 218, 218, 1.0),
            )),
        home: ListEventsScreen(),
        routes: Routes.routesMap,
      ),
    );
  }
}
