// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Event {
  String? address;
  String? announce;
  int changeDT;
  String dateEnd;
  String dateStart;
  List<dynamic> email;
  List<dynamic> phone;
  int id;
  String? instagram;
  String? latitude;
  String? longitude;
  String? location;
  String name;
  String picture;
  int? position;
  String? timeEnd;
  String? timeStart;
  int? type;
  List<dynamic>? url;
  int? views;
  String? youtube;
  Event({
    this.address,
    this.announce,
    required this.changeDT,
    required this.dateEnd,
    required this.dateStart,
    required this.email,
    required this.phone,
    required this.id,
    this.instagram,
    this.latitude,
    this.longitude,
    this.location,
    required this.name,
    required this.picture,
    this.position,
    this.timeEnd,
    this.timeStart,
    this.type,
    this.url,
    this.views,
    this.youtube,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'announce': announce,
      'changeDT': changeDT,
      'dateEnd': dateEnd,
      'dateStart': dateStart,
      'email': email,
      'phone': phone,
      'id': id,
      'instagram': instagram,
      'latitude': latitude,
      'longitude': longitude,
      'location': location,
      'name': name,
      'picture': picture,
      'position': position,
      'timeEnd': timeEnd,
      'timeStart': timeStart,
      'type': type,
      'url': url,
      'views': views,
      'youtube': youtube,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      address: map['Address'] != null ? map['Address'] as String : null,
      announce: map['Announce'] != null ? map['Announce'] as String : null,
      changeDT: map['ChangeDT'] as int,
      dateEnd: map['DateEnd'] as String,
      dateStart: map['DateStart'] as String,
      email: List<String>.from(map['Email'] as List<String>),
      phone: List<String>.from(map['Phone'] as List<String>),
      id: map['Id'] as int,
      instagram: map['Instagram'] != null ? map['Instagram'] as String : null,
      latitude: map['Latitude'] != null ? map['Latitude'] as String : null,
      longitude: map['Longitude'] != null ? map['Longitude'] as String : null,
      location: map['Location'] != null ? map['Location'] as String : null,
      name: map['Name'] as String,
      picture: map['Picture'] as String,
      position: map['Position'] != null ? map['Position'] as int : null,
      timeEnd: map['TimeEnd'] != null ? map['TimeEnd'] as String : null,
      timeStart: map['TimeStart'] != null ? map['TimeStart'] as String : null,
      type: map['Type'] != null ? map['Type'] as int : null,
      url: map['Url'] != null
          ? List<String>.from((map['Url'] as List<String>))
          : null,
      views: map['Views'] != null ? map['Views'] as int : null,
      youtube: map['Youtube'] != null ? map['Youtube'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);
}
