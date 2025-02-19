import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoucusCubit extends Cubit<FocusNode?> {
  FoucusCubit() : super((null));

  void setFocus(FocusNode node) {
    emit(node);
  }
}
