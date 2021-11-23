import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Events {
  addEvent,
  deleteEvent,
}

class CitiesBloc extends Bloc<Events, State>{
  CitiesBloc(State<StatefulWidget> initialState) : super(initialState);
  
}