import 'dart:async';

import '../models/event_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ListEventsDataProvider {
  List<Event> _listEvents = [];
  List<Event> get listEventsGet => _listEvents;

  Future<List<Event>> fetchListEvents() async {
    late List<Event> listEvents = [];

    try {
      var url = Uri.parse('https://events-backend.dme.ru/api/AppStructure');
      final response = await http.post(
        url,
        headers: <String, String>{
          'Authentication': 'DlhDsw769HHFYU6t6hgsds78hJH98kjlsd87uhjh',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: jsonEncode(<String, String>{'uid': 'browser', 'lang': 'ru'}),
      );

      if (response.statusCode == 200) {
        var extractedData = json.decode(response.body);
        extractedData = extractedData['Res']['Lenta'];

        extractedData.forEach((event) {
          listEvents.add(Event(
            address:
                event['Address'] != null ? event['Address'] as String : null,
            announce:
                event['Announce'] != null ? event['Announce'] as String : null,
            changeDT: event['ChangeDT'] as int,
            dateEnd: event['DateEnd'] as String,
            dateStart: event['DateStart'] as String,
            email: List<dynamic>.from(event['Email'] as List<dynamic>),
            phone: List<dynamic>.from(event['Phone'] as List<dynamic>),
            id: event['Id'] as int,
            instagram: event['Instagram'] != null
                ? event['Instagram'] as String
                : null,
            latitude:
                event['Latitude'] != null ? event['Latitude'] as String : null,
            longitude: event['Longitude'] != null
                ? event['Longitude'] as String
                : null,
            location:
                event['Location'] != null ? event['Location'] as String : null,
            name: event['Name'] as String,
            picture: event['Picture'] as String,
            position:
                event['Position'] != null ? event['Position'] as int : null,
            timeEnd:
                event['TimeEnd'] != null ? event['TimeEnd'] as String : null,
            timeStart: event['TimeStart'] != null
                ? event['TimeStart'] as String
                : null,
            type: event['Type'] != null ? event['Type'] as int : null,
            url: event['Url'] != null
                ? List<dynamic>.from((event['Url'] as List<dynamic>))
                : null,
            views: event['Views'] != null ? event['Views'] as int : null,
            youtube:
                event['Youtube'] != null ? event['Youtube'] as String : null,
          ));
        });
        _listEvents = listEvents;
        print('success');
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error :${e.toString()}');
    }
    return listEvents;
  }
}
