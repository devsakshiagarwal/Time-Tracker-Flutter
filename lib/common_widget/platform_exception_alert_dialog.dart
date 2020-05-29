import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_tracker_flutter_course/common_widget/platform_alert_dialog.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super(
            title: title,
            content: _message(exception),
            defaultActionText: "OK");

  static String _message(PlatformException exception) {
    return _errors[exception.message] ?? exception.message;
  }

  static Map<String, String> _errors = {
    "ERROR_WEAK_PASSWORD": "",
    "ERROR_INVALID_EMAIL": "",
    "ERROR_EMAIL_ALREADY_IN_USE": "",
    "ERROR_WRONG_PASSWORD": "The Password is invalid",
    "ERROR_USER_NOT_FOUND": "",
    "ERROR_USER_DISABLED": "",
    "ERROR_TOO_MANY_REQUESTS": "",
    "ERROR_OPERATION_NOT_ALLOWED": "",
  };
}
