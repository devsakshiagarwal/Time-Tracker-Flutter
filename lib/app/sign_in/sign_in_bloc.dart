import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter_course/app/services/auth.dart';

class SignInBloc {
  SignInBloc({@required this.auth});

  final AuthBase auth;

  final StreamController<bool> _isLoadingController = StreamController<bool>();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  void setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      setIsLoading(false);
      rethrow;
    }
  }

  Future<User> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);

  Future<User> signInAnonymously() async =>
      await _signIn(auth.signInAnonymously);
}
