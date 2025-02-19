import 'package:flutter_bloc/flutter_bloc.dart';

enum MyTheme { light, dark }

class ThemeCubit extends Cubit<MyTheme?> {
  ThemeCubit() : super(null);
  void changeTheme(MyTheme theme) {
    emit(theme);
  }
}
