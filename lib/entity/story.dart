class StoryEntity {
  final int storyID;
  final String content;
  final List<String> images;
  final String created;
  final String updated;
  final int likes;
  final int comments;

  const StoryEntity._({
    this.storyID,
    this.content,
    this.images,
    this.created,
    this.updated,
    this.likes,
    this.comments,
  });

  factory StoryEntity.fromJson(Map<String, dynamic> json) {
    return StoryEntity._(
      storyID: json['storyid'],
      content: json['content'],
      images: json['images'],
      created: json['created'],
      updated: json['updated'],
      likes: json['likes'],
      comments: json['comments'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['storyid'] = storyID;
    json['content'] = content;
    json['images'] = images;
    json['created'] = created;
    json['updated'] = updated;
    json['likes'] = likes;
    json['comments'] = comments;

    return json;
  }
}
