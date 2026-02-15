class UserEntity {
  final String? name;
  final String? email;
  final String? userId;

  const UserEntity({
    required this.name,
    required this.email,
    required this.userId,
  });
  toMap() => {'name': name, 'email': email, 'userId': userId};
}
