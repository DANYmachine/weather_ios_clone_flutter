import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ios_clone/classes/Theme/ThemeEvent.dart';
import 'package:weather_ios_clone/classes/Theme/ThemeState.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    on<ToDarkThemeEvent>((event, emit) async {
      emit(DarkThemeState());
    });
    on<ToLightThemeEvent>((event, emit) async {
      log(LightThemeState().toString());
      emit(LightThemeState());
    });
  }
}
