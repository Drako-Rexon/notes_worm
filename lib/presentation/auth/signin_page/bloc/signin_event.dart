part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SigninInitialEvent extends SigninEvent {
  SigninInitialEvent({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}
