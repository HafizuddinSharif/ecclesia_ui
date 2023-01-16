part of 'logged_user_bloc.dart';

abstract class LoggedUserEvent {
  const LoggedUserEvent();
}

class LoginLoggedUserEvent extends LoggedUserEvent {
  final Voter user;

  const LoginLoggedUserEvent({required this.user});
}
