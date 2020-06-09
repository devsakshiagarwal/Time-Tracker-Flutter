import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'email_signin_form_change_notifier.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: EmailSignInFormChangeNotifier.create(context),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
