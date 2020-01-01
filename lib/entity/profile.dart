class ProfileEntity {
  final String email;
  final String name;
  final String imageURL;
  final String intro;

  final int stories;
  final int followers;
  final int followings;

  const ProfileEntity({
    this.email,
    this.name,
    this.imageURL,
    this.intro,
    this.stories,
    this.followers,
    this.followings,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) {
    return ProfileEntity(
      email: json['email'],
      name: json['name'],
      imageURL: json['image'],
      intro: json['intro'],
      stories: json['stories'],
      followers: json['followers'],
      followings: json['followings'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['email'] = email;
    json['name'] = name;
    json['image'] = imageURL;
    json['intro'] = intro;
    json['stories'] = stories;
    json['followers'] = followers;
    json['followings'] = followings;

    return json;
  }
}
