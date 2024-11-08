part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitialState extends SplashScreenState {}

class SplashScreenLoadingState extends SplashScreenState {}

class SplashScreenNoTokenState extends SplashScreenState {}

class SplashScreenNavigateEnterState extends SplashScreenState {}

class SplashScreenErrorState extends SplashScreenState {}

class SplashScreenNoInternetState extends SplashScreenState {}
