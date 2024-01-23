import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    @Default(0) int? balance,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(User user) => UserModel(
        uid: user.uid,
        email: user.email,
        name: user.name,
        photoUrl: user.photoUrl,
        balance: user.balance,
      );

  User toEntity() {
    return User(
      uid: uid,
      email: email,
      balance: balance,
      name: name,
      photoUrl: photoUrl,
    );
  }
}
