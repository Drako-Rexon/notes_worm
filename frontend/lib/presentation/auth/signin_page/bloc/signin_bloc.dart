import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_notes_app/common/helper_function/http_provider.dart';

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
      Map<String, String> body = {
        "emailusername": event.email,
        "password": event.password
      };
      log(body.toString());
      final response = await request('post', '/api/v1/auth/login', json: body);
      final json = jsonDecode(response.body);
      log('success ${response.body}');
      if (response.statusCode == 200) {
        final SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('token', json['token']);
        emit(SigninSuccessState());
        return;
      }
      emit(SigninErrorState());
      return;
    } catch (e) {
      emit(SigninErrorState());
      return;
    }
  }
}
