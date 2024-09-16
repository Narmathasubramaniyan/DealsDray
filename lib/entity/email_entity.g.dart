// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailEntity _$EmailEntityFromJson(Map<String, dynamic> json) => EmailEntity(
      email: json['email'] as String,
      password: json['password'] as String,
      referral: (json['referralCode'] as num).toInt(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$EmailEntityToJson(EmailEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'referralCode': instance.referral,
      'userId': instance.userId,
    };
