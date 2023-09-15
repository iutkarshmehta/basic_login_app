part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenState {}

class LoginScreenInitial extends LoginScreenState {}

class LoginScreenSuccess extends LoginScreenState {
  final userId;

  LoginScreenSuccess({required this.userId});
}
