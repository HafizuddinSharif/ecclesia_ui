part of 'logged_user_bloc.dart';

abstract class LoggedUserEvent {
  const LoggedUserEvent();
}

class LoginLoggedUserEvent extends LoggedUserEvent {
  final String userId;

  const LoginLoggedUserEvent({required this.userId});
}
