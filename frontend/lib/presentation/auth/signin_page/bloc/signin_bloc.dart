import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_notes_app/common/helper_function/http_provider.dart';
import 'package:sub_notes_app/core/config/config_files/local_storage_key.dart';
import 'package:sub_notes_app/data/model/user_model.dart';

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
      AppKey _appkey = AppKey();
      Map<String, String> body = {
        "emailusername": event.email,
        "password": event.password
      };
      final response = await request('post', '/api/v1/auth/login', json: body);
      final json = jsonDecode(response.body);
      log('success ${response.body}');
      if (response.statusCode == 200) {
        final SharedPreferences pref = await SharedPreferences.getInstance();

        UserModel userModel = UserModel.fromJson(json['data']);
        pref.setString(_appkey.getTokenKey, json['token']);
        pref.setString(_appkey.getStandard, userModel.standard);
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
