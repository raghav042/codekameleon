class UserModel {
  const UserModel({
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.bio,
    required this.points,
    required this.isOnline,
    required this.recentLanguage,
    required this.registeredAt,
    required this.lastSeenAt,
  });
  final String name;
  final String email;
  final String imageUrl;
  final String bio;
  final int points;
  final bool isOnline;
  final String recentLanguage;
  final String registeredAt;
  final String lastSeenAt;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      imageUrl: json['imageUrl'],
      bio: json['bio'],
      points: json['points'],
      isOnline: json['isOnline'],
      recentLanguage: json['recentLanguage'],
      registeredAt: json['registeredAt'],
      lastSeenAt: json['lastSeenAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'bio': bio,
      'points': points,
      'isOnline': isOnline,
      'recentLanguage': recentLanguage,
      'registeredAt': registeredAt,
      'lastSeenAt': lastSeenAt,
    };
  }
}
