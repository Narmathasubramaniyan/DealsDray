import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EmailEntity extends Equatable {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'referralCode')
  final int referral;

  @JsonKey(name: 'userId')
  final String userId;

  const EmailEntity(
      {required this.email,
      required this.password,
      required this.referral,
      required this.userId});

  factory EmailEntity.fromJson(Map<String, dynamic> json) =>
      _$EmailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EmailEntityToJson(this);

  @override
  List<Object?> get props => [email, password, referral];
}
