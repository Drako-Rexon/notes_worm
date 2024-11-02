import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninEvent>((event, emit) {});
    on<SigninInitialEvent>(signinInitialEvent);
  }

  FutureOr<void> signinInitialEvent(
      SigninInitialEvent event, Emitter<SigninState> emit) async {
    emit(SigninLoadingState());
    try {
      log(event.email);
      log(event.password);
    } catch (e) {
      emit(SigninErrorState());
    }
  }
}
