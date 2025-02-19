// ignore_for_file: overridden_fields, annotate_overrides

import 'package:photo_labs/domain_layer/entity/photo_detail_entity.dart';

// ignore: must_be_immutable
class PhotoDetailModel extends PhotoDetailEntity {
  String id;
  String? createdAt;
  String? updatedAt;
  int? width;
  int? height;
  String color;
  String blurHash;
  int downloads;
  int likes;
  bool? likedByUser;
  bool? publicDomain;
  String description;
  Exif? exif;
  Location? location;
  List<Tag>? tags;
  List<Collection>? currentUserCollections;
  Urls urls;
  Links? links;
  User? user;

  PhotoDetailModel({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    required this.color,
    required this.blurHash,
    required this.downloads,
    required this.likes,
    this.likedByUser,
    this.publicDomain,
    required this.description,
    this.exif,
    this.location,
    this.tags,
    this.currentUserCollections,
    required this.urls,
    this.links,
    this.user,
  }) : super(
            id: id,
            blurHash: blurHash,
            downloads: downloads,
            likes: likes,
            description: description,
            urls: urls);

  factory PhotoDetailModel.fromJson(Map<String, dynamic> json) {
    return PhotoDetailModel(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      blurHash: json['blur_hash'],
      downloads: json['downloads'],
      likes: json['likes'],
      likedByUser: json['liked_by_user'],
      publicDomain: json['public_domain'],
      description: json['description'] ?? "",
      exif: json['exif'] != null ? Exif.fromJson(json['exif']) : null,
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      tags: json['tags'] != null
          ? List<Tag>.from(json['tags'].map((x) => Tag.fromJson(x)))
          : null,
      currentUserCollections: json['current_user_collections'] != null
          ? List<Collection>.from(json['current_user_collections']
              .map((x) => Collection.fromJson(x)))
          : null,
      urls: Urls.fromJson(json['urls']),
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}

class Exif {
  String? make;
  String? model;
  String? name;
  String? exposureTime;
  String? aperture;
  String? focalLength;
  int? iso;

  Exif({
    this.make,
    this.model,
    this.name,
    this.exposureTime,
    this.aperture,
    this.focalLength,
    this.iso,
  });

  Exif.fromJson(Map<String, dynamic> json) {
    make = json['make'];
    model = json['model'];
    name = json['name'];
    exposureTime = json['exposure_time'];
    aperture = json['aperture'];
    focalLength = json['focal_length'];
    iso = json['iso'];
  }
}

class Location {
  String? city;
  String? country;
  Position? position;

  Location({
    this.city,
    this.country,
    this.position,
  });

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
  }
}

class Position {
  double? latitude;
  double? longitude;

  Position({
    this.latitude,
    this.longitude,
  });

  Position.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}

class Tag {
  String? title;

  Tag({
    this.title,
  });

  Tag.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }
}

class Collection {
  int? id;
  String? title;
  String? publishedAt;
  String? lastCollectedAt;
  String? updatedAt;
  dynamic coverPhoto;
  dynamic user;

  Collection({
    this.id,
    this.title,
    this.publishedAt,
    this.lastCollectedAt,
    this.updatedAt,
    this.coverPhoto,
    this.user,
  });

  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    publishedAt = json['published_at'];
    lastCollectedAt = json['last_collected_at'];
    updatedAt = json['updated_at'];
    coverPhoto = json['cover_photo'];
    user = json['user'];
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }
}

class Links {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  Links({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'];
    downloadLocation = json['download_location'];
  }
}

class User {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? portfolioUrl;
  String? bio;
  String? location;
  int? totalLikes;
  int? totalPhotos;
  int? totalCollections;
  Links? links;

  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.totalLikes,
    this.totalPhotos,
    this.totalCollections,
    this.links,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    totalCollections = json['total_collections'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
}
