import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenEvent>(splashScreenEvent);
  }

  FutureOr<void> splashScreenEvent(
      SplashScreenEvent event, Emitter<SplashScreenState> emit) async {
    emit(SplashScreenLoading());
    try {
      await Future.delayed(const Duration(seconds: 2), () {
        emit(SplashScreenSuccess());
      });
    } catch (e) {
      emit(SplashScreenError());
    }
  }
}
