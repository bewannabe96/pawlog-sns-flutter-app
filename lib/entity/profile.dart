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
      imageURL: json['imageurl'],
      intro: json['intro'],
      stories: json['stories'],
      followers: json['followers'],
      followings: json['followings'],
    );
  }
}
