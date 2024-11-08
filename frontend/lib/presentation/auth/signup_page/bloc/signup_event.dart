part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupInitialEvent extends SignupEvent {
  SignupInitialEvent({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
  final String name;
  final String username;
}

class SignupAddInfoEvent extends SignupEvent {
  SignupAddInfoEvent({
    required this.role,
    required this.grade,
  });
  final String grade;
  final String role;
}
