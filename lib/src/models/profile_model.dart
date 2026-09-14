class ProfileModel {
  final String id;
  final String email;
  final String username;

  ProfileModel({
    required this.id,
    required this.email,
    required this.username,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
    );
  }
}
