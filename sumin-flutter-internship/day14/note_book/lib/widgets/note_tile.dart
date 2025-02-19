// import 'package:flutter/material.dart';
// import 'package:note_book/cubit/note_cubit.dart';
// import 'package:note_book/screen/editnote.dart';

// class NoteTile extends StatelessWidget {
//   const NoteTile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//             onLongPress: () {
//               context.read<NoteCubit>().remove(index);
//             },
//             onDoubleTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => EditNote(
//                     noteIndex: index,
//                     previousNote: note,
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: screenHeight * .02,
//                 horizontal: screenWidth * .03,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: SingleChildScrollView(
//                 physics: const NeverScrollableScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       note.subject,
//                       style: BodyText.style,
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       note.note,
//                       style: NoteText.style,
//                       overflow: TextOverflow.ellipsis,
//                       softWrap: true,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//   }
// }