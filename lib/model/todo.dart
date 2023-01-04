import 'package:flutter/foundation.dart';

import '../utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

// class Todo {
//   DateTime createdTime;
//   String title;
//   String id;
//   String description;
//   bool isDone;
//   Todo({
//     required this.createdTime,
//     required this.title,
//     this.description = '',
//     this.id = '',
//     this.isDone = false,
//   });
//   static Todo fromJson(Object json) {
// if (json is Map<String, dynamic>) {
// return Todo(
// createdTime: Utils.toDateTime(json['created Time']),
// title: json['title'],
// description: json['description'],
// id: json['id'],
// isDone: json['isDone'],
// );
// } else {
// return Todo();
// }
// }
// static Todo fromJson(Object json) => Todo(
//       createdTime:
//           Utils.toDateTime((json as Map<String, dynamic>)['created Time']),
//       title: (json )['title'],
//       description: (json )['description'],
//       id: (json)['id'],
//       isDone: (json )['isDone'],
//     );

// static Todo fromJson(Object json) => Todo(
//  createdTime: Utils.toDateTime(json['created Time']),
//       createdTime: Utils.toDateTime(json['created Time']) ?? DateTime.now(),
//       title: json['title'] ?? '',
//      title: json['title'],
//       description: json['description'],
//       id: json['id'],
//       isDone: json['isDone'],
//     );

//   Map<String, dynamic> toJson() => {
//         'created time': Utils.fromDateTimeToJson(createdTime),
//         'title': title,
//         'description': description,
//         'id': id,
//         'isDone': isDone,
//       };
// }

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;
  Todo({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id = '',
    this.isDone = false,
  });
// static Todo fromJson(Object json) => Todo(
//     createdTime:
//         Utils.toDateTime((json as Map<String, dynamic>)['created Time']),
//     title: (json as Map<String, dynamic>)['title'],
//     description: (json as Map<String, dynamic>)['description'],
//     id: (json as Map<String, dynamic>)['id'],
//     isDone: (json as Map<String, dynamic>)['isDone'],
//   );
  static Todo fromJson(Map<String, dynamic> json) => Todo(
        createdTime: Utils.toDateTime(json['created Time']),
        title: json['title'],
        description: json['description'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'created time': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'id': id,
        'isDone': isDone,
      };
}
