import 'package:flutter/cupertino.dart';

class Job {
  final String name;
  final dynamic ratePerHour;

  Job({@required this.name, @required this.ratePerHour});

  factory Job.fromMap(Map<String, dynamic> data) {
    if(data == null) {
      return null;
    }
    final String name = data["name"];
    final String ratePerHour = data["ratePerHour"];
    return Job(
      name: name,
      ratePerHour: ratePerHour,
    );
  }
  Map<String, dynamic> toMap() {
    return {"name": name, "ratePerHour": ratePerHour};
  }
}
