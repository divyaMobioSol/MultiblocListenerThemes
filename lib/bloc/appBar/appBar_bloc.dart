import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:multi_bloc_provider/bloc/appBar/appBar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {
  AppBarCubit() : super(AppBarState(text: 'Loaded', color: Colors.pink));

  void purpleColor() =>
      emit(AppBarLoaded(text: state.text! + 'helloo', color: Colors.purple));
  void amberColor() =>
      emit(AppBarLoaded(text: state.text! + 'helloo', color: Colors.amber));

  void GreenColor() =>
      emit(AppBarLoaded(text: state.text! + 'helloo', color: Colors.green));
}
