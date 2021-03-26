//import 'package:meta/meta.dart';
//import 'package:chatting/models/models.dart';
class PostList {
  bool status;
  String message;
  List<Posts> posts;

  PostList({this.status, this.message, this.posts});

  PostList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['posts'] != null) {
      posts = new List<Posts>();
      json['posts'].forEach((v) {
        posts.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  List<String> images;
  List<TaggedUser> taggedUser;
  List<CommentUser> commentIds;
  List<LikeIds> likeIds;
  int viewCount;
  int shareCount;
  String deletedAt;
  String sId;
  String content;
  TaggedUser postedBy;
  String createdAt;
  String updatedAt;
  int iV;

  Posts(
      {this.images,
      this.taggedUser,
      this.commentIds,
      this.likeIds,
      this.viewCount,
      this.shareCount,
      this.deletedAt,
      this.sId,
      this.content,
      this.postedBy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Posts.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    if (json['tagged_user'] != null) {
      taggedUser = new List<TaggedUser>();
      json['tagged_user'].forEach((v) {
        taggedUser.add(new TaggedUser.fromJson(v));
      });
    }
    if (json['commentIds'] != null) {
      commentIds = new List<CommentUser>();
      json['commentIds'].forEach((v) {
        commentIds.add(new CommentUser.fromJson(v));
      });
    }
    if (json['likeIds'] != null) {
      likeIds = new List<LikeIds>();
      json['likeIds'].forEach((v) {
        likeIds.add(new LikeIds.fromJson(v));
      });
    }
    viewCount = json['view_count'];
    shareCount = json['share_count'];
    deletedAt = json['deleted_at'];
    sId = json['_id'];
    content = json['content'];
    postedBy = json['posted_by'] != null
        ? new TaggedUser.fromJson(json['posted_by'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    if (this.taggedUser != null) {
      data['tagged_user'] = this.taggedUser.map((v) => v.toJson()).toList();
    }
    if (this.commentIds != null) {
      data['commentIds'] = this.commentIds.map((v) => v.toJson()).toList();
    }
    if (this.likeIds != null) {
      data['likeIds'] = this.likeIds.map((v) => v.toJson()).toList();
    }
    data['view_count'] = this.viewCount;
    data['share_count'] = this.shareCount;
    data['deleted_at'] = this.deletedAt;
    data['_id'] = this.sId;
    data['content'] = this.content;
    if (this.postedBy != null) {
      data['posted_by'] = this.postedBy.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class TaggedUser {
  String sId;
  String firstName;
  String lastName;

  TaggedUser({this.sId, this.firstName, this.lastName});

  TaggedUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}

class CommentUser {
  String sId;
  String firstName;
  String lastName;

  CommentUser({this.sId, this.firstName, this.lastName});

  CommentUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}

class LikeIds {
  Null deletedAt;
  String sId;
  String status;
  String postId;
  TaggedUser likedBy;
  String createdAt;
  String updatedAt;
  int iV;

  LikeIds(
      {this.deletedAt,
      this.sId,
      this.status,
      this.postId,
      this.likedBy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  LikeIds.fromJson(Map<String, dynamic> json) {
    deletedAt = json['deleted_at'];
    sId = json['_id'];
    status = json['status'];
    postId = json['post_id'];
    likedBy = json['liked_by'] != null
        ? new TaggedUser.fromJson(json['liked_by'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deleted_at'] = this.deletedAt;
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['post_id'] = this.postId;
    if (this.likedBy != null) {
      data['liked_by'] = this.likedBy.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

/*class PostModel {
  String content;
  String images;
  String taggedUser;
  String postedBy;
  String commentIds;
  String likeIds;
  int viewCount;
  int shareCount;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;

  toMap() {
    return {
      "users": {
        "content": this.content,
        "image": this.images,
        "tagged_user": this.taggedUser,
        "posted_by": this.postedBy,
        "commentIds": this.commentIds,
        "likedIds": this.likeIds,
        "view_count": this.viewCount,
        "share_count": this.shareCount,
        "create_date": this.createdAt,
        "updated_date": this.updatedAt,
        "deleted_date": this.deletedAt
      }
    };
  }
}*/

/*class PostModel {
  final User user;
  final String caption;
  final String timeAgo;
  final String imageUrl;
  final int likes;
  final int comments;
  final int shares;

  PostModel({
    @required this.user,
    this.caption,
    this.timeAgo,
    this.imageUrl,
    this.likes,
    this.comments,
    this.shares,
  });
}

List<PostModel> postLists = [
  PostModel(
    user: currentUser,
    caption: 'Check out these cool puppers',
    timeAgo: '58m',
    imageUrl: 'https://images.unsplash.com/photo-1525253086316-d0c936c814f8',
    likes: 1202,
    comments: 184,
    shares: 96,
  ),
  PostModel(
    user: onlineUsers[0],
    caption:
        'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    timeAgo: '3hr',
    imageUrl: null,
    likes: 683,
    comments: 79,
    shares: 18,
  ),
];*/
