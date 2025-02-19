import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_book/config/colour.dart';
import 'package:note_book/cubit/note_cubit.dart';
import 'package:note_book/note_model.dart';
import 'package:note_book/screen/add_note.dart';
import 'package:note_book/widgets/app_bar.dart';
import 'package:note_book/widgets/note_collection.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NoteCubit>().loadDataFromSharedPreferences();
    // try gareko
    return Scaffold(
      backgroundColor: backgroudColor,
      appBar: CustomAppBar(
        leading: Image.asset("assets/images/burger.png"),
        title: "Recent Notes",
        trailer: const Icon(
          Icons.more_vert,
        ),
      ),
      body: const NoteCollection(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<NoteModel?>(
            context: context,
            builder: (BuildContext context) {
              return const AddNote();
            },
          ).then((NoteModel? value) {
            if (value != null) {
              context.read<NoteCubit>().addNotes(value);
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
