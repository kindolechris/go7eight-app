class Post {
  int? id;
  String? uid;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;
  int? noViews;
  int? noShares;
  int? noLikes;
  int? noComments;
  String? location;
  User? user;
  String? status;
  List<Media>? media;

  // New parameters
  double? price;
  String? currency;
  bool? isFeatured;
  String? category;
  List<String>? tags;
  String? bookingUrl;
  bool? isBookable;
  Map<String, dynamic>? additionalInfo;
  double? rating;
  int? ratingCount;
  String? duration;
  bool? verified;

  Post({
    this.id,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.description,
    this.noViews,
    this.noShares,
    this.noComments,
    this.noLikes,
    this.location,
    this.user,
    this.status,
    this.media,
    // New parameters
    this.price,
    this.currency,
    this.isFeatured,
    this.category,
    this.tags,
    this.bookingUrl,
    this.isBookable,
    this.additionalInfo,
    this.rating,
    this.ratingCount,
    this.duration,
    this.verified,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    title = json['title'];
    description = json['description'];
    noViews = json['noViews'];
    noShares = json['noShares'];
    noComments = json['noComments'];
    noLikes = json['noLikes'];
    location = json['location'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    status = json['status'];

    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }

    // New parameters
    price = json['price'] != null ? double.tryParse(json['price'].toString()) : null;
    currency = json['currency'];
    isFeatured = json['isFeatured'];
    category = json['category'];

    if (json['tags'] != null) {
      tags = List<String>.from(json['tags']);
    }

    bookingUrl = json['bookingUrl'];
    isBookable = json['isBookable'];

    if (json['additionalInfo'] != null) {
      additionalInfo = Map<String, dynamic>.from(json['additionalInfo']);
    }

    rating = json['rating'] != null ? double.tryParse(json['rating'].toString()) : null;
    ratingCount = json['ratingCount'];
    duration = json['duration'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['noViews'] = this.noViews;
    data['noShares'] = this.noShares;
    data['noLikes'] = this.noLikes;
    data['noComments'] = this.noComments;
    data['location'] = this.location;

    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }

    data['status'] = this.status;

    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }

    // New parameters
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['isFeatured'] = this.isFeatured;
    data['category'] = this.category;
    data['tags'] = this.tags;
    data['bookingUrl'] = this.bookingUrl;
    data['isBookable'] = this.isBookable;
    data['additionalInfo'] = this.additionalInfo;
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;
    data['duration'] = this.duration;
    data['verified'] = this.verified;

    return data;
  }
}

class User {
  int? id;
  String? uid;
  String? createdAt;
  String? updatedAt;
  String? username;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  bool? accountNonExpired;
  bool? accountNonLocked;
  bool? credentialsNonExpired;
  bool? enabled;
  String? authenticationMethod;
  String? email;
  String? country;
  String? nickname;
  String? dob;
  String? emailVerifiedAt;
  String? phoneNumberVerifiedAt;

  // New parameters
  String? profileImageUrl;
  String? bio;
  bool? verified;
  int? followersCount;
  int? followingCount;
  int? postsCount;
  String? role;
  bool? isFollowing;

  User({
    this.id,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.accountNonExpired,
    this.accountNonLocked,
    this.credentialsNonExpired,
    this.enabled,
    this.authenticationMethod,
    this.email,
    this.country,
    this.nickname,
    this.dob,
    this.emailVerifiedAt,
    this.phoneNumberVerifiedAt,
    // New parameters
    this.profileImageUrl,
    this.bio,
    this.verified,
    this.followersCount,
    this.followingCount,
    this.postsCount,
    this.role,
    this.isFollowing,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
    enabled = json['enabled'];
    authenticationMethod = json['authenticationMethod'];
    email = json['email'];
    country = json['country'];
    nickname = json['nickname'];
    dob = json['dob'];
    emailVerifiedAt = json['emailVerifiedAt'];
    phoneNumberVerifiedAt = json['phoneNumberVerifiedAt'];

    // New parameters
    profileImageUrl = json['profileImageUrl'];
    bio = json['bio'];
    verified = json['verified'];
    followersCount = json['followersCount'];
    followingCount = json['followingCount'];
    postsCount = json['postsCount'];
    role = json['role'];
    isFollowing = json['isFollowing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['accountNonExpired'] = this.accountNonExpired;
    data['accountNonLocked'] = this.accountNonLocked;
    data['credentialsNonExpired'] = this.credentialsNonExpired;
    data['enabled'] = this.enabled;
    data['authenticationMethod'] = this.authenticationMethod;
    data['email'] = this.email;
    data['country'] = this.country;
    data['nickname'] = this.nickname;
    data['dob'] = this.dob;
    data['emailVerifiedAt'] = this.emailVerifiedAt;
    data['phoneNumberVerifiedAt'] = this.phoneNumberVerifiedAt;

    // New parameters
    data['profileImageUrl'] = this.profileImageUrl;
    data['bio'] = this.bio;
    data['verified'] = this.verified;
    data['followersCount'] = this.followersCount;
    data['followingCount'] = this.followingCount;
    data['postsCount'] = this.postsCount;
    data['role'] = this.role;
    data['isFollowing'] = this.isFollowing;

    return data;
  }
}

class Media {
  int? id;
  String? uid;
  String? createdAt;
  String? updatedAt;
  String? url;
  String? status;
  String? mediaType;

  // New parameters
  String? thumbnailUrl;
  int? width;
  int? height;
  String? description;
  String? altText;
  double? size;
  String? mimeType;

  Media({
    this.id,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.status,
    this.mediaType,
    // New parameters
    this.thumbnailUrl,
    this.width,
    this.height,
    this.description,
    this.altText,
    this.size,
    this.mimeType,
  });

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    url = json['url'];
    status = json['status'];
    mediaType = json['mediaType'];

    // New parameters
    thumbnailUrl = json['thumbnailUrl'];
    width = json['width'];
    height = json['height'];
    description = json['description'];
    altText = json['altText'];
    size = json['size'] != null ? double.tryParse(json['size'].toString()) : null;
    mimeType = json['mimeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['url'] = this.url;
    data['status'] = this.status;
    data['mediaType'] = this.mediaType;

    // New parameters
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['width'] = this.width;
    data['height'] = this.height;
    data['description'] = this.description;
    data['altText'] = this.altText;
    data['size'] = this.size;
    data['mimeType'] = this.mimeType;

    return data;
  }
}