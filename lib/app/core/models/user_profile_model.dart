import 'dart:convert';

// Perfil de usuario
class UserProfileModel {
  final String id;
  final String userName;
  final String email;
  final String? name;
  final bool isActive;

  UserProfileModel({
    required this.id,
    required this.userName,
    required this.email,
    this.name,
    required this.isActive,
  });

  UserProfileModel copyWith({
    String? id,
    String? userName,
    String? email,
    String? name,
    bool? isActive,
  }) {
    return UserProfileModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userName': userName});
    result.addAll({'email': email});
    if (name != null) {
      result.addAll({'name': name});
    }
    result.addAll({'isActive': isActive});

    return result;
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      name: map['name'],
      isActive: map['isActive'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfileModel(id: $id, userName: $userName, email: $email, name: $name, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfileModel &&
        other.id == id &&
        other.userName == userName &&
        other.email == email &&
        other.name == name &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userName.hashCode ^
        email.hashCode ^
        name.hashCode ^
        isActive.hashCode;
  }
}
