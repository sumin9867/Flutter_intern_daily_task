// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: annotate_overrides, overridden_fields

import 'package:photo_labs/domain_layer/entity/photo_random_entity.dart';

class PhotoRandom extends PhotoRandomEntity {
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? width;
  final int? height;
  final String? color;
  final String blurHash;
  final int? downloads;
  final int? likes;
  final bool? likedByUser;
  final String? description;
  final Exif? exif;
  final Location? location;
  final Urls urls;
  final Links? links;
  final User user;

  const PhotoRandom({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.color,
    required this.blurHash,
    this.downloads,
    this.likes,
    this.likedByUser,
    this.description,
    this.exif,
    this.location,
    required this.urls,
    this.links,
    required this.user,
  }) : super(
            id: id,
            blurHash: blurHash,
            exif: exif,
            urls: urls,
            user: user,
            description: description,
            downloads: downloads,
            likes: likes,
            location: location);

  factory PhotoRandom.fromJson(Map<String, dynamic> json) {
    return PhotoRandom(
      id: json['id'] ?? '',
      blurHash: json['blur_hash'] ?? '',
      exif: Exif.fromJson(json['exif'] ?? {}),
      urls: Urls.fromJson(json['urls'] ?? {}),
      user: User.fromJson(json['user'] ?? {}),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      width: json['width'],
      height: json['height'],
      color: json['color'],
      downloads: json['downloads'],
      likes: json['likes'],
      likedByUser: json['liked_by_user'],
      description: json['description'] ?? "",
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
    );
  }
}

class Exif {
  final String make;
  final String model;
  final String exposureTime;
  final String aperture;
  final String focalLength;
  final int iso;

  Exif({
    required this.make,
    required this.model,
    required this.exposureTime,
    required this.aperture,
    required this.focalLength,
    required this.iso,
  });

  factory Exif.fromJson(Map<String, dynamic> json) {
    return Exif(
      make: json['make'] ?? '',
      model: json['model'] ?? '',
      exposureTime: json['exposure_time'] ?? '',
      aperture: json['aperture'] ?? '',
      focalLength: json['focal_length'] ?? '',
      iso: json['iso'] ?? 0,
    );
  }
}

class Location {
  final String name;
  final String city;
  final String country;
  final Position position;

  Location({
    required this.name,
    required this.city,
    required this.country,
    required this.position,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] ?? '',
      city: json['city'] ?? '',
      country: json['country'] ?? '',
      position: Position.fromJson(json['position'] ?? {}),
    );
  }
}

class Position {
  final double latitude;
  final double longitude;

  Position({required this.latitude, required this.longitude});

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
    );
  }
}

class Urls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
      raw: json['raw'] ?? '',
      full: json['full'] ?? '',
      regular: json['regular'] ?? '',
      small: json['small'] ?? '',
      thumb: json['thumb'] ?? '',
    );
  }
}

class Links {
  final String self;
  final String html;
  final String download;
  final String downloadLocation;

  Links({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'] ?? '',
      html: json['html'] ?? '',
      download: json['download'] ?? '',
      downloadLocation: json['download_location'] ?? '',
    );
  }
}

class User {
  final String id;
  final DateTime updatedAt;
  final String username;
  final String name;
  final String? portfolioUrl;
  final String? bio;
  final String? location;
  final int totalLikes;
  final int totalPhotos;
  final int totalCollections;
  final String? instagramUsername;
  final String? twitterUsername;
  final Links links;

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    this.portfolioUrl,
    this.bio,
    this.location,
    required this.totalLikes,
    required this.totalPhotos,
    required this.totalCollections,
    this.instagramUsername,
    this.twitterUsername,
    required this.links,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
      username: json['username'] ?? '',
      name: json['name'] ?? '',
      portfolioUrl: json['portfolio_url'],
      bio: json['bio'],
      location: json['location'],
      totalLikes: json['total_likes'] ?? 0,
      totalPhotos: json['total_photos'] ?? 0,
      totalCollections: json['total_collections'] ?? 0,
      instagramUsername: json['instagram_username'],
      twitterUsername: json['twitter_username'],
      links: Links.fromJson(json['links'] ?? {}),
    );
  }
}
