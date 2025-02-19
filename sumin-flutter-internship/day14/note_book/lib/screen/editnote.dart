import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_book/config/colour.dart';
import 'package:note_book/config/theme.dart';
import 'package:note_book/cubit/note_cubit.dart';
import 'package:note_book/note_model.dart';
import 'package:note_book/screen/recent_note.dart';
import 'package:note_book/widgets/app_bar.dart';
import 'package:note_book/widgets/button.dart';

class EditNote extends StatelessWidget {
  final int noteIndex;
  final NoteModel previousNote;

  const EditNote(
      {Key? key, required this.noteIndex, required this.previousNote});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final subjectController = TextEditingController(text: previousNote.subject);
    final noteController = TextEditingController(text: previousNote.note);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroudColor,
      appBar: CustomAppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const RecentPage();
                },
              ));
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: screenHeight * .04,
            )),
        title: 'Add Note',
        trailer: Icon(
          Icons.more_vert,
          size: screenHeight * .03,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
            bottom: screenHeight * .03,
            left: screenWidth * .05,
            right: screenWidth * .05,
          ),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: true,
                        controller: subjectController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Subject field can't be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Subject Here ...",
                          hintStyle: Heading1.style,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Note field can't be empty";
                            }
                            return null;
                          },
                          controller: noteController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Write your note here...',
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<NoteCubit, List<NoteModel>>(
                builder: (context, state) {
                  return CustomButton(
                    title: "Edit Note",
                    onPressed: () {
                      final updatedsubject = subjectController.text;
                      final updatedNotes = noteController.text;

                      NoteModel updatemodel = NoteModel(
                          subject: updatedsubject, note: updatedNotes);
                      context
                          .read<NoteCubit>()
                          .editNote(noteIndex, updatemodel);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
