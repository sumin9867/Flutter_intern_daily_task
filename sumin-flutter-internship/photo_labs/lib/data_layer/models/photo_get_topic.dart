// ignore_for_file: overridden_fields

import 'package:photo_labs/domain_layer/entity/photo_get_topic_entity.dart';

class TopicListModel extends TopicListEntity {
  @override
  final String id;
  @override
  final String slug;
  @override
  final String title;
  final String? description;
  final String? publishedAt;
  final String? updatedAt;
  final String? startsAt;
  final String? endsAt;
  final String? onlySubmissionsAfter;
  final String? visibility;
  final bool? featured;
  final int? totalPhotos;
  final List<Owner>? owners;
  final List<dynamic>? currentUserContributions;
  final Map<String, dynamic>? totalCurrentUserSubmissions;
  // final CoverPhoto coverPhoto;
  final List<PreviewPhoto>? previewPhotos;

  const TopicListModel({
    required this.id,
    required this.slug,
    required this.title,
    this.description,
    this.publishedAt,
    this.updatedAt,
    this.startsAt,
    this.endsAt,
    this.onlySubmissionsAfter,
    this.visibility,
    this.featured,
    this.totalPhotos,
    this.owners,
    this.currentUserContributions,
    this.totalCurrentUserSubmissions,
    // required this.coverPhoto,
    this.previewPhotos,
  }) : super(
          id: id,
          slug: slug,
          title: title,
        );

  factory TopicListModel.fromJson(Map<String, dynamic> json) {
    return TopicListModel(
      id: json['id'],
      slug: json['slug'],
      title: json['title'],
      description: json['description'],
      publishedAt: json['published_at'],
      updatedAt: json['updated_at'],
      startsAt: json['starts_at'],
      endsAt: json['ends_at'],
      onlySubmissionsAfter: json['only_submissions_after'],
      visibility: json['visibility'],
      featured: json['featured'],
      totalPhotos: json['total_photos'],
      owners: (json['owners'] as List<dynamic>?)
          ?.map((ownerJson) => Owner.fromJson(ownerJson))
          .toList(),
      currentUserContributions: json['current_user_contributions'],
      totalCurrentUserSubmissions: json['total_current_user_submissions'],
      // coverPhoto: json['cover_photo'],
      previewPhotos: (json['preview_photos'] as List<dynamic>?)
          ?.map((previewJson) => PreviewPhoto.fromJson(previewJson))
          .toList(),
    );
  }
}

class Owner {
  final String id;
  final String? updatedAt;
  final String? username;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? twitterUsername;
  final String? portfolioUrl;
  final String? bio;
  final String? location;
  final Map<String, dynamic>? links;
  final ProfileImage? profileImage;
  final String? instagramUsername;
  final int? totalCollections;
  final int? totalLikes;
  final int? totalPhotos;
  final bool? acceptedTos;

  Owner({
    required this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'],
      updatedAt: json['updated_at'],
      username: json['username'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      twitterUsername: json['twitter_username'],
      portfolioUrl: json['portfolio_url'],
      bio: json['bio'],
      location: json['location'],
      links: json['links'],
      profileImage: json['profile_image'] != null
          ? ProfileImage.fromJson(json['profile_image'])
          : null,
      instagramUsername: json['instagram_username'],
      totalCollections: json['total_collections'],
      totalLikes: json['total_likes'],
      totalPhotos: json['total_photos'],
      acceptedTos: json['accepted_tos'],
    );
  }
}

class ProfileImage {
  final String small;
  final String medium;
  final String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    return ProfileImage(
      small: json['small'],
      medium: json['medium'],
      large: json['large'],
    );
  }
}

class CoverPhoto {
  final String id;
  final String? createdAt;
  final String? updatedAt;
  final String? promotedAt;
  final int? width;
  final int? height;
  final String? color;
  final String? blurHash;
  final String? description;
  final String? altDescription;
  final Urls? urls;
  final Links? links;
  final User? user;

  CoverPhoto({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.user,
  });

  factory CoverPhoto.fromJson(Map<String, dynamic> json) {
    return CoverPhoto(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      promotedAt: json['promoted_at'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      blurHash: json['blur_hash'],
      description: json['description'],
      altDescription: json['alt_description'],
      urls: json['urls'] != null ? Urls.fromJson(json['urls']) : null,
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
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
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
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
      self: json['self'],
      html: json['html'],
      download: json['download'],
      downloadLocation: json['download_location'],
    );
  }
}

class User {
  final String id;
  final String? updatedAt;
  final String? username;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? twitterUsername;
  final String? portfolioUrl;
  final String? bio;
  final String? location;
  final Map<String, dynamic>? links;
  final ProfileImage? profileImage;
  final String? instagramUsername;
  final int? totalCollections;
  final int? totalLikes;
  final int? totalPhotos;
  final bool? acceptedTos;

  User({
    required this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      updatedAt: json['updated_at'],
      username: json['username'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      twitterUsername: json['twitter_username'],
      portfolioUrl: json['portfolio_url'],
      bio: json['bio'],
      location: json['location'],
      links: json['links'],
      profileImage: json['profile_image'] != null
          ? ProfileImage.fromJson(json['profile_image'])
          : null,
      instagramUsername: json['instagram_username'],
      totalCollections: json['total_collections'],
      totalLikes: json['total_likes'],
      totalPhotos: json['total_photos'],
      acceptedTos: json['accepted_tos'],
    );
  }
}

class PreviewPhoto {
  final String id;
  final String? createdAt;
  final String? updatedAt;
  final Urls? urls;

  PreviewPhoto({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.urls,
  });

  factory PreviewPhoto.fromJson(Map<String, dynamic> json) {
    return PreviewPhoto(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      urls: json['urls'] != null ? Urls.fromJson(json['urls']) : null,
    );
  }
}
