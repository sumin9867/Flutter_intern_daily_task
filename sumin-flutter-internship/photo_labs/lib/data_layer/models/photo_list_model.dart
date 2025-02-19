// ignore_for_file: must_be_immutable, annotate_overrides, overridden_fields, prefer_void_to_null

import 'package:photo_labs/domain_layer/entity/photo_list_entiry.dart';

class PhotoModel extends PhotoListEntity {
  String id;
  String slug;
  // AlternativeSlugs? alternativeSlugs;
  // String? createdAt;
  // String? updatedAt;
  // String? promotedAt;
  // int? width;
  // int? height;
  // String? color;
  String? blurHash;
  // String? description;
  // String? altDescription;
  // List<String>? breadcrumbs;
  Urls urls; // Modified to Urls?
  // PhotoLinks? links;
  int likes;
  // bool? likedByUser;
  // List<String>? currentUserCollections;
  // dynamic sponsorship;
  // TopicSubmissions? topicSubmissions;
  // String? assetType;
  // User? user;

  PhotoModel({
    required this.id,
    required this.slug,
    // this.alternativeSlugs,
    // this.createdAt,
    // this.updatedAt,
    // this.promotedAt,
    // this.width,
    // this.height,
    // this.color,
    this.blurHash,
    // this.description,
    // this.altDescription,
    // this.breadcrumbs,
    required this.urls, // Modified to Urls?
    // this.links,
    required this.likes,
    // this.likedByUser,
    // this.currentUserCollections,
    // this.sponsorship,
    // this.topicSubmissions,
    // this.assetType,
    // this.user,
  }) : super(
          id: id,
          slug: slug,
          blurHash: blurHash,
          // description: description ?? '',
          urls: urls,
          likes: likes,
        );

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      slug: json['slug'],
      // alternativeSlugs: json['alternative_slugs']
      //     ? AlternativeSlugs.fromJson(json['alternative_slugs'])
      //     : null,
      // createdAt: json['created_at'],
      // updatedAt: json['updated_at'],
      // promotedAt: json['promoted_at'],
      // width: json['width'],
      // height: json['height'],
      // color: json['color'],
      blurHash: json['blur_hash'] ?? "",
      // description: json['description'],
      // altDescription: json['alt_description'],
      // breadcrumbs: json['breadcrumbs'] != null
      //     ? List<String>.from(json['breadcrumbs'])
      //     : null,
      urls: Urls.fromJson(json['urls']),
      // links: json['links'],
      likes: json['likes'],
      // likedByUser: json['liked_by_user'] ?? false,
      // currentUserCollections: json['current_user_collections']!
      //     ? List<String>.from(json['current_user_collections'])
      //     : null,
      // sponsorship: json['sponsorship'],
      // topicSubmissions: json['topic_submissions']
      //     ? TopicSubmissions.fromJson(json['topic_submissions'])
      //     : null,
      // assetType: json['asset_type'],
      // user: User.fromJson(json['user'])
    );
  }
}

class AlternativeSlugs {
  String? en;
  String? es;
  String? ja;
  String? fr;
  String? it;
  String? ko;
  String? de;
  String? pt;

  AlternativeSlugs(
      {this.en, this.es, this.ja, this.fr, this.it, this.ko, this.de, this.pt});

  AlternativeSlugs.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    es = json['es'];
    ja = json['ja'];
    fr = json['fr'];
    it = json['it'];
    ko = json['ko'];
    de = json['de'];
    pt = json['pt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['es'] = es;
    data['ja'] = ja;
    data['fr'] = fr;
    data['it'] = it;
    data['ko'] = ko;
    data['de'] = de;
    data['pt'] = pt;
    return data;
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Urls();
    }

    return Urls(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
      smallS3: json['small_s3'],
    );
  }
}

class PhotoLinks {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  PhotoLinks({this.self, this.html, this.download, this.downloadLocation});

  PhotoLinks.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'];
    downloadLocation = json['download_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['html'] = html;
    data['download'] = download;
    data['download_location'] = downloadLocation;
    return data;
  }
}

class TopicSubmissions {
  TopicSubmissions();

  TopicSubmissions.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class User {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  Null twitterUsername;
  Null portfolioUrl;
  String? bio;
  String? location;
  PhotoLinks? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  int? totalPromotedPhotos;
  int? totalIllustrations;
  int? totalPromotedIllustrations;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  User(
      {this.id,
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
      this.totalPromotedPhotos,
      this.totalIllustrations,
      this.totalPromotedIllustrations,
      this.acceptedTos,
      this.forHire,
      this.social});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    links = json['links'] != null ? PhotoLinks.fromJson(json['links']) : null;
    profileImage = json['profile_image'] != null
        ? ProfileImage.fromJson(json['profile_image'])
        : null;
    instagramUsername = json['instagram_username'];
    totalCollections = json['total_collections'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    totalPromotedPhotos = json['total_promoted_photos'];
    totalIllustrations = json['total_illustrations'];
    totalPromotedIllustrations = json['total_promoted_illustrations'];
    acceptedTos = json['accepted_tos'];
    forHire = json['for_hire'];
    social = json['social'] != null ? Social.fromJson(json['social']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['updated_at'] = updatedAt;
    data['username'] = username;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['twitter_username'] = twitterUsername;
    data['portfolio_url'] = portfolioUrl;
    data['bio'] = bio;
    data['location'] = location;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (profileImage != null) {
      data['profile_image'] = profileImage!.toJson();
    }
    data['instagram_username'] = instagramUsername;
    data['total_collections'] = totalCollections;
    data['total_likes'] = totalLikes;
    data['total_photos'] = totalPhotos;
    data['total_promoted_photos'] = totalPromotedPhotos;
    data['total_illustrations'] = totalIllustrations;
    data['total_promoted_illustrations'] = totalPromotedIllustrations;
    data['accepted_tos'] = acceptedTos;
    data['for_hire'] = forHire;
    if (social != null) {
      data['social'] = social!.toJson();
    }
    return data;
  }
}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['medium'] = medium;
    data['large'] = large;
    return data;
  }
}

class Social {
  String? instagramUsername;
  Null portfolioUrl;
  Null twitterUsername;
  Null paypalEmail;

  Social(
      {this.instagramUsername,
      this.portfolioUrl,
      this.twitterUsername,
      this.paypalEmail});

  Social.fromJson(Map<String, dynamic> json) {
    instagramUsername = json['instagram_username'];
    portfolioUrl = json['portfolio_url'];
    twitterUsername = json['twitter_username'];
    paypalEmail = json['paypal_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['instagram_username'] = instagramUsername;
    data['portfolio_url'] = portfolioUrl;
    data['twitter_username'] = twitterUsername;
    data['paypal_email'] = paypalEmail;
    return data;
  }
}
