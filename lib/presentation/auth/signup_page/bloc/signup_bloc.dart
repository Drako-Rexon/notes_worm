import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {});
    on<SignupInitialEvent>(signinInitialEvent);
  }

  FutureOr<void> signinInitialEvent(
      SignupInitialEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoadingState());
    try {



















      
    } catch (e) {}
  }
}
