import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sub_notes_app/common/helper_function/http_provider.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitialState()) {
    on<SignupEvent>((event, emit) {});
    on<SignupInitialEvent>(signinInitialEvent);
    on<SignupAddInfoEvent>(signupAddInfoEvent);
  }

  FutureOr<void> signinInitialEvent(
      SignupInitialEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoadingState());
    try {
      Map<String, String> body = {
        "name": event.name,
        "email": event.email,
        "password": event.password,
        "username": event.username,
        "role": event.role,
        "standard": event.standard,
      };
      log(body.toString());

      final response =
          await request('post', '/api/v1/auth/register', json: body);
      log("${response.statusCode} and ${response.body}");
      if (response.statusCode == 201) {
        emit(SignupSuccessState());
        return;
      }
      emit(SignupErrorState());
      return;
    } catch (e) {
      emit(SignupErrorState());
      return;
    }
  }

  FutureOr<void> signupAddInfoEvent(
      SignupAddInfoEvent event, Emitter<SignupState> emit) async {
    emit(SignupAddInfoSuccessState());

    try {
      final body = {
        "role": event.role,
        "grade": event.grade,
      };

      final response =
          await request('put', '/api/v1/auth/add-info', json: body);
      if (response.statusCode == 204) {
        emit(SignupAddInfoSuccessState());
        return;
      }
      emit(SignupAddInfoErrorState());
      return;
    } catch (e) {
      emit(SignupAddInfoErrorState());
    }
  }
}
