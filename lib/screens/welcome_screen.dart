import 'package:basic_login_app/routes/app_routes_name.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String userId;

  const WelcomeScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome Screen',),
        leading: BackButton(onPressed: (){
          context.beamToNamed(AppRoutesNames.loginScreen);

        },),
        centerTitle: false,),
      body: Center(child: Text('Welcome '+userId,style: const TextStyle(fontSize: 25,),)),
    );
  }
}
