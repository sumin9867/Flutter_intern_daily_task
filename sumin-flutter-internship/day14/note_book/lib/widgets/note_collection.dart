import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_book/config/theme.dart';
import 'package:note_book/cubit/note_cubit.dart';
import 'package:note_book/note_model.dart';
import 'package:note_book/screen/editnote.dart';

class NoteCollection extends StatelessWidget {
  const NoteCollection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<NoteCubit, List<NoteModel>>(builder: (context, notes) {
      return MasonryGridView.count(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .03),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return GestureDetector(
            onLongPress: () {
              context.read<NoteCubit>().remove(index);
            },
            onDoubleTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNote(
                    noteIndex: index,
                    previousNote: note,
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * .02,
                horizontal: screenWidth * .03,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    note.subject,
                    style: BodyText.style,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    note.note,
                    style: NoteText.style,
                  ),
                ],
              ),
            ),
          );
        },
        crossAxisCount: 2,
        mainAxisSpacing: screenHeight * .018,
        crossAxisSpacing: screenWidth * .03,
      );
    });
  }
}
