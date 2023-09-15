import 'package:basic_login_app/features/login/bloc/login_screen_bloc.dart';
import 'package:beamer/beamer.dart';
import 'package:core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../routes/app_routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  final LoginScreenBloc loginScreenBloc = LoginScreenBloc();
  bool _validateEmpty = false;
  bool _validateWrongCred = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wallpapers'),
          centerTitle: false,
        ),
        body: BlocProvider(
            create: (context) => loginScreenBloc,
            child: BlocListener<LoginScreenBloc, LoginScreenState>(
              listener: (context, state) {
                if (state is LoginScreenSuccess) {
                  context.beamToNamed(AppRoutesNames.welcomeScreen, data: userIdController.text);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: Text(
                        'Please login to your account',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextField(
                        controller: userIdController,
                        decoration: InputDecoration(
                          labelText: 'Enter UserId',
                          hintText: 'Enter UserId',
                          border: const OutlineInputBorder(),
                          errorText: _validateEmpty || _validateWrongCred
                              ? 'Seems something is wrong...'
                              : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Enter Password',
                          hintText: 'Enter Password',
                          border: const OutlineInputBorder(),
                          errorText: _validateEmpty || _validateWrongCred
                              ? 'Seems something is wrong...'
                              : null,
                        ),
                        obscureText: true,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (userIdController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          if (userIdController.text == AppConstants.userId &&
                              passwordController.text == AppConstants.password) {
                            loginScreenBloc
                                .add(LoginScreenInitialEvent(userId: userIdController.text));
                          } else {
                            setState(() {
                              _validateWrongCred = !_validateWrongCred;
                            });
                          }
                        } else {
                          setState(() {
                            _validateEmpty = !_validateEmpty;
                          });
                        }
                      },
                      child: Container(
                        color: Colors.blue,
                        width: double.infinity,
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Does not have Account? ',
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Register',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
