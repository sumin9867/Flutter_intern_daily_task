// ignore_for_file: annotate_overrides, overridden_fields

import 'package:photo_labs/domain_layer/entity/photo_topic_list_entity.dart';

class PhotoTopicListView extends TopicListViewEntity {
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int width;
  final int height;
  final String? color;
  final String blurHash;
  // final int? likes;
  // final bool? likedByUser;
  final String? description;
  // final UnsplashUser? user;
  // final List<UnsplashCollection>? currentUserCollections;
  final UnsplashUrls? urls;
  // final UnsplashLinks? links;

  const PhotoTopicListView({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.width,
    required this.height,
    this.color,
    required this.blurHash,
    // this.likes,
    // this.likedByUser,
    this.description,
    // this.user,
    // this.currentUserCollections,
    this.urls,
    // this.links,
  }) : super(
            id: id,
            width: width,
            height: height,
            blurHash: blurHash,
            decription: description,
            urls: urls);

  factory PhotoTopicListView.fromJson(Map<String, dynamic> json) {
    return PhotoTopicListView(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      width: json['width'],
      height: json['height'],
      color: json['color'],
      blurHash: json['blur_hash'],
      // likes: json['likes'],
      // likedByUser: json['liked_by_user'],
      description: json['description'] ?? "",
      // user: UnsplashUser.fromJson(json['user']),
      // currentUserCollections:
      //     (json['current_user_collections'] as List<dynamic>? ?? [])
      //         .map((collection) => UnsplashCollection.fromJson(collection))
      //         .toList(),
      urls: UnsplashUrls.fromJson(json['urls']),
      // links: UnsplashLinks.fromJson(json['links']),
    );
  }
}

class UnsplashUser {
  final String id;
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
  final UnsplashProfileImage profileImage;
  final UnsplashLinks links;

  UnsplashUser({
    required this.id,
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
    required this.profileImage,
    required this.links,
  });

  factory UnsplashUser.fromJson(Map<String, dynamic> json) {
    return UnsplashUser(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      portfolioUrl: json['portfolio_url'],
      bio: json['bio'],
      location: json['location'],
      totalLikes: json['total_likes'],
      totalPhotos: json['total_photos'],
      totalCollections: json['total_collections'],
      instagramUsername: json['instagram_username'],
      twitterUsername: json['twitter_username'],
      profileImage: UnsplashProfileImage.fromJson(json['profile_image']),
      links: UnsplashLinks.fromJson(json['links']),
    );
  }
}

class UnsplashProfileImage {
  final String small;
  final String medium;
  final String large;

  UnsplashProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory UnsplashProfileImage.fromJson(Map<String, dynamic> json) {
    return UnsplashProfileImage(
      small: json['small'],
      medium: json['medium'],
      large: json['large'],
    );
  }
}

class UnsplashCollection {
  final int id;
  final String title;
  final DateTime publishedAt;
  final DateTime lastCollectedAt;
  final DateTime updatedAt;
  final dynamic coverPhoto;
  final dynamic user;

  UnsplashCollection({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.lastCollectedAt,
    required this.updatedAt,
    this.coverPhoto,
    this.user,
  });

  factory UnsplashCollection.fromJson(Map<String, dynamic> json) {
    return UnsplashCollection(
      id: json['id'],
      title: json['title'],
      publishedAt: DateTime.parse(json['published_at']),
      lastCollectedAt: DateTime.parse(json['last_collected_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      coverPhoto: json['cover_photo'],
      user: json['user'],
    );
  }
}

class UnsplashUrls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  UnsplashUrls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory UnsplashUrls.fromJson(Map<String, dynamic> json) {
    return UnsplashUrls(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
    );
  }
}

class UnsplashLinks {
  final String self;
  final String html;
  final String download;
  final String downloadLocation;

  UnsplashLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory UnsplashLinks.fromJson(Map<String, dynamic> json) {
    return UnsplashLinks(
      self: json['self'],
      html: json['html'],
      download: json['download'],
      downloadLocation: json['download_location'],
    );
  }
}
