part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupInitialEvent extends SignupEvent {
  SignupInitialEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}