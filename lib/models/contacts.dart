import 'package:firebase_auth/firebase_auth.dart';

class Contact {
  static const tblContact = 'contacts';
  static const colId = 'id';
  static const colName = 'name';
  static const colDirector = 'director';

  Contact({required this.id, required this.name, required this.director});
  // ignore: avoid_init_to_null
  int? id = null;
  late String name;
  late String director;

  Contact.fromMap(Map<dynamic, dynamic> map) {
    id = map[colId];
    name = map[colName];
    director = map[colDirector];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colId: id,
      colName: name,
      colDirector: director
    };
    // ignore: unnecessary_null_comparison
    if (User != null) {
      map[colId] = id;
    }
    return map;
  }
}
