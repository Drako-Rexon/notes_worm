part of 'homepage_bloc.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class HomepageFetchedSuccessState extends HomepageState {}

class HomepageFetchedFailureState extends HomepageState {}

class HomepageFetchingState extends HomepageState {}
