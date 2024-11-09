part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupInitialEvent extends SignupEvent {
  SignupInitialEvent({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
    required this.standard,
  });

  final String email;
  final String password;
  final String name;
  final String username;
  final String role;
  final String standard;
}

class SignupAddInfoEvent extends SignupEvent {
  SignupAddInfoEvent({
    required this.role,
    required this.grade,
  });
  final String grade;
  final String role;
}
