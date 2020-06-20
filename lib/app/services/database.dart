import 'package:flutter/cupertino.dart';
import 'package:time_tracker_flutter_course/app/home/model/job.dart';
import 'package:time_tracker_flutter_course/app/services/api_path.dart';
import 'package:time_tracker_flutter_course/app/services/firestore_service.dart';

abstract class Database {
  Future<void> setJob(Job job);

  Stream<List<Job>> jobsStream();
}

String documentIdFromCurrentData() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);

  final String uid;
  final _service = FirestoreService.instance;

  Future<void> setJob(Job job) async => await _service.setData(
        path: ApiPath.job(uid, job.id),
        data: job.toMap(),
      );

  Stream<List<Job>> jobsStream() => _service.collectionStream(
      path: ApiPath.jobs(uid), builder: (data, documentId) => Job.fromMap(data, documentId));
}
