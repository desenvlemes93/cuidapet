class UserModel {
  final String email;
  final String registerType;
  final String imgAvatar;

  UserModel({
    required this.email,
    required this.registerType,
    required this.imgAvatar,
  });

  UserModel.empty()
      : email = '',
        registerType = '',
        imgAvatar = '';

  UserModel copyWith({
    String? email,
    String? registerType,
    String? imgAvatar,
  }) {
    return UserModel(
      email: email ?? this.email,
      registerType: registerType ?? this.registerType,
      imgAvatar: imgAvatar ?? this.imgAvatar,
    );
  }
}
