class UserEntity {
  final String? name;
  final String? email;
  final String? userId;
  final String? fcmToken;

  const UserEntity({
    required this.name,
    required this.email,
    required this.userId,
    this.fcmToken,
  });
}
