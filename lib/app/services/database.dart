import 'package:flutter/cupertino.dart';
import 'package:time_tracker_flutter_course/app/home/model/job.dart';
import 'package:time_tracker_flutter_course/app/services/api_path.dart';
import 'package:time_tracker_flutter_course/app/services/firestore_service.dart';

abstract class Database {
  Future<void> createJob(Job job);

  Stream<List<Job>> jobsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);

  final String uid;
  final _service = FirestoreService.instance;

  Future<void> createJob(Job job) async => await _service.setData(
        path: ApiPath.job(uid, "job_abc"),
        data: job.toMap(),
      );

  Stream<List<Job>> jobsStream() => _service.collectionStream(
      path: ApiPath.jobs(uid), builder: (data) => Job.fromMap(data));
}
