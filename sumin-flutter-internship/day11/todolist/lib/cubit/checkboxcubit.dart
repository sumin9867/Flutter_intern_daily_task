import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Cubit
enum CheckboxState { checked, unchecked }

class CheckboxCubit extends Cubit<CheckboxState> {
  CheckboxCubit() : super(CheckboxState.unchecked);

  void toggleCheckbox() async {
    final prefs = await SharedPreferences.getInstance();
    final currentState = state;
    if (currentState == CheckboxState.checked) {
      await prefs.setBool('checkbox_state', false);
      emit(CheckboxState.unchecked);
    } else {
      await prefs.setBool('checkbox_state', true);
      emit(CheckboxState.checked);
    }
  }

  Future<void> loadCheckboxState() async {
    final prefs = await SharedPreferences.getInstance();
    final savedState = prefs.getBool('checkbox_state') ?? false;
    emit(savedState ? CheckboxState.checked : CheckboxState.unchecked);
  }
}
