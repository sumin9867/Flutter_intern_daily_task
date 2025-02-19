import 'dart:convert';

import 'package:note_book/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteMemory {
  Future<void> saveData(List<NoteModel> notes) async {
    final pref = await SharedPreferences.getInstance();
    final List<String> noteStrings =
        notes.map((note) => jsonEncode(note.toJson())).toList();
    pref.setStringList('sumin', noteStrings);
  }

  static Future<List<NoteModel>> loaddata() async {
    final pref = await SharedPreferences.getInstance();
    final List<String>? data = pref.getStringList('sumin');

    final List<NoteModel> dataObject = data!.map((e) {
      final jsonMap = jsonDecode(e) as Map<String, dynamic>;
      return NoteModel.fromJson(jsonMap);
    }).toList();
    return dataObject;
  }
}
