class Event {
  String? address;
  String? announce;
  int changeDT;
  String dateEnd;
  String dateStart;
  List<String> email;
  List<String> phone;
  int id;
  String? instagram;
  String? latitude;
  String? longitude;
  String? location;
  String name;
  String? picture;
  int? position;
  String? timeEnd;
  String? timeStart;
  int? type;
  List<String>? url;
  int? views;
  String? uoutube;
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
    this.picture,
    this.position,
    this.timeEnd,
    this.timeStart,
    this.type,
    this.url,
    this.views,
    this.uoutube,
  });
}
