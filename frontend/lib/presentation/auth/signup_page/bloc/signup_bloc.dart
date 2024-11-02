import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sub_notes_app/common/helper_function/http_provider.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitialState()) {
    on<SignupEvent>((event, emit) {});
    on<SignupInitialEvent>(signinInitialEvent);
  }

  FutureOr<void> signinInitialEvent(
      SignupInitialEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoadingState());
    try {
      Map<String, String> body = {
        "name": event.name,
        "email": event.email,
        "password": event.password
      };

      final respone =
          await request('post', '/api/v1/auth/register', json: body);
      if (respone.statusCode == 201) {
        emit(SignupSuccessState());
        return;
      }
      emit(SignupFailureState(error: 'Failed to sign up'));
      return;
    } catch (e) {
      emit(SignupErrorState());
    }
  }
}
