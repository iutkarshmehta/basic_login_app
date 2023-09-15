import 'package:basic_login_app/routes/app_routes_name.dart';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  final String userId;

  const WelcomeScreen({super.key, required this.userId});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Screen',
        ),
        leading: BackButton(
          onPressed: () {
            context.beamToNamed(AppRoutesNames.loginScreen);
          },
        ),
        centerTitle: false,
      ),
      body: Center(
        child: Text('Welcome ${widget.userId}'),
      ),
    );
  }
}
