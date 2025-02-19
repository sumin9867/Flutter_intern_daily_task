import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final String subject;
  final String note;

  const NoteModel({
    required this.subject,
    required this.note,
  });

  static NoteModel fromJson(Map<String, dynamic> json) {
    return NoteModel(
      subject: json['subject'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['subject'] = subject;
    data['note'] = note;
    return data;
  }

  NoteModel copyWith({
    String? subject,
    String? note,
  }) {
    return NoteModel(
      subject: subject ?? this.subject,
      note: note ?? this.note,
    );
  }

  static fromjson(jsonDecode) {}

  @override
  List<Object?> get props => [
        subject,
        note,
      ];
}
