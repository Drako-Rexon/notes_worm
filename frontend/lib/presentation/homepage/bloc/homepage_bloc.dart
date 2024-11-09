import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sub_notes_app/common/helper_function/http_provider.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    on<HomePageInitLoadEvent>(homePageInitLoadEvent);
  }

  FutureOr<void> homePageInitLoadEvent(
      HomePageInitLoadEvent event, Emitter<HomepageState> emit) async {
    emit(HomepageFetchingState());
    try {
      final response =
          await request('get', '/api/v1/subject', params: {"std": "6"});
      log(jsonDecode(response.body).toString());
      if (response.statusCode == 200) {
        emit(HomepageFetchedSuccessState());
        return;
      }
      emit(HomepageFetchedFailureState());
    } catch (err) {
      emit(HomepageFetchedFailureState());
    }
  }
}
