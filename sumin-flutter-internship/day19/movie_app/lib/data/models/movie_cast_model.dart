// ignore_for_file: overridden_fields

import 'package:movie_app/domain/entities/cast_entity.dart';

class CastCrewResultModel {
  int id;
  List<CastModel> cast;
  List<Crew> crew;

  CastCrewResultModel({
    required this.id,
    required this.cast,
    required this.crew,
  });

  CastCrewResultModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        cast = List<CastModel>.from(
          json['cast'].map((x) => CastModel.fromJson(x)),
        ),
        crew = List<Crew>.from(
          json['crew'].map((x) => Crew.fromJson(x)),
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cast': cast.map((x) => x.toJson()).toList(),
      'crew': crew.map((x) => x.toJson()).toList(),
    };
  }
}

class CastModel extends CastEntity {
  final int? castId;
  @override
  final String character;
  @override
  final String creditId;
  final int? gender;
  final int? id;
  @override
  final String name;
  final int? order;
  final String? profilePath;

  const CastModel({
    this.castId,
    required this.character,
    required this.creditId,
    this.gender,
    this.id,
    required this.name,
    this.order,
    required this.profilePath,
  }) : super(
          creditId: creditId,
          name: name,
          posterPath: profilePath,
          character: character,
        );

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      gender: json['gender'],
      id: json['id'],
      name: json['name'],
      order: json['order'],
      profilePath: json['profile_path'],
    );
  }

  static List<CastModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CastModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'cast_id': castId,
      'character': character,
      'credit_id': creditId,
      'gender': gender,
      'id': id,
      'name': name,
      'order': order,
      'profile_path': profilePath,
    };
  }
}

class Crew {
  late String creditId;
  late String department;
  late int gender;
  late int id;
  late String job;
  late String name;
  late String? profilePath;

  Crew({
    required this.creditId,
    required this.department,
    required this.gender,
    required this.id,
    required this.job,
    required this.name,
    this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      creditId: json['credit_id'],
      department: json['department'],
      gender: json['gender'],
      id: json['id'],
      job: json['job'],
      name: json['name'],
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'credit_id': creditId,
      'department': department,
      'gender': gender,
      'id': id,
      'job': job,
      'name': name,
      'profile_path': profilePath,
    };
  }
}
