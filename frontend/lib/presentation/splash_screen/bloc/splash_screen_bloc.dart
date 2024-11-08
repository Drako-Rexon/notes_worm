import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_notes_app/core/config/config_files/local_storage_key.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitialState()) {
    on<SplashScreenEvent>(splashScreenEvent);
  }

  FutureOr<void> splashScreenEvent(
      SplashScreenEvent event, Emitter<SplashScreenState> emit) async {
    emit(SplashScreenLoadingState());
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      AppKey appKey = AppKey();
      String? token = pref.getString(appKey.getTokenKew);
      await Future.delayed(const Duration(seconds: 2), () async {
        bool result = await InternetConnection().hasInternetAccess;
        if (result) {
          if (token != null) {
            emit(SplashScreenNavigateEnterState());
            return;
          }
          emit(SplashScreenNoTokenState());
          return;
        } else {
          emit(SplashScreenNoInternetState());
          return;
        }
      });
    } catch (e) {
      emit(SplashScreenErrorState());
      return;
    }
  }
}
