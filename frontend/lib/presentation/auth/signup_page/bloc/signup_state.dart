part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {}

class SignupErrorState extends SignupState {}

class SignupFailureState extends SignupState {
  SignupFailureState({required this.error});
  final String error;
}

// * state for adding information additionally

class SignupAddInfoLoadingState extends SignupState {}

class SignupAddInfoSuccessState extends SignupState {}

class SignupAddInfoErrorState extends SignupState {}
