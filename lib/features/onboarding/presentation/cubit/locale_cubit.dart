import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState(Locale('uz')));

  void toRussian() => emit(const LocaleState(Locale('ru')));

  void toUzbek() => emit(const LocaleState(Locale('uz')));
}
