import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meta/meta.dart';

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
      await Future.delayed(const Duration(seconds: 2), () async {
        bool result = await InternetConnection().hasInternetAccess;
        if (result) {
          emit(SplashScreenSuccessState());
          return;
        } else {
          emit(SplashScreenNoInternetState());
          return;
        }
      });
    } catch (e) {
      emit(SplashScreenErrorState());
    }
  }
}
