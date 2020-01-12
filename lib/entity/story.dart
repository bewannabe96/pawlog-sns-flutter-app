class StoryEntity {
  final int storyID;

  final String profileImageURL;
  final String profileName;

  final String content;
  final List<String> images;
  final String created;
  final String updated;

  final int likes;
  final int comments;

  final bool userLiked;

  const StoryEntity._({
    this.storyID,
    this.profileImageURL,
    this.profileName,
    this.content,
    this.images,
    this.created,
    this.updated,
    this.likes,
    this.comments,
    this.userLiked,
  });

  factory StoryEntity.fromJson(Map<String, dynamic> json) {
    return StoryEntity._(
      storyID: json['storyid'],
      profileImageURL: json['profile'],
      profileName: json['owner'],
      content: json['content'],
      images: (json['images'] as List).map((image) => image as String).toList(),
      created: json['created'],
      updated: json['updated'],
      likes: json['likes'],
      comments: json['comments'],
      userLiked: json['userliked'],
    );
  }
}

class CommentEntity {
  final String name;
  final String imageURL;
  final String content;
  final String created;

  const CommentEntity._({
    this.name,
    this.imageURL,
    this.content,
    this.created,
  });

  factory CommentEntity.fromJson(Map<String, dynamic> json) {
    return CommentEntity._(
      name: json['name'],
      imageURL: json['imageurl'],
      content: json['content'],
      created: json['created'],
    );
  }
}
