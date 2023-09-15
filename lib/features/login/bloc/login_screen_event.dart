part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenEvent {}

class LoginScreenInitialEvent extends LoginScreenEvent {
  final String userId;

  LoginScreenInitialEvent({required this.userId});
}
