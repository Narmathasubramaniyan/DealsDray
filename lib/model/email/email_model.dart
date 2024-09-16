import 'package:dealsdray/entity/email_entity.dart';
import 'package:equatable/equatable.dart';

class EmailModel extends Equatable {
  final String email;
  final String password;
  final int referral;
  final String userId;

  const EmailModel({
    required this.email,
    required this.password,
    required this.referral,
    required this.userId,
  });

  // Create an instance of EmailModel from an EmailEntity.
  factory EmailModel.fromEntity(EmailEntity emailEntity) {
    return EmailModel(
      email: emailEntity.email,
      password: emailEntity.password,
      referral: emailEntity.referral,
      userId: emailEntity.userId,
    );
  }

  // Convert an EmailModel instance to EmailEntity.
  EmailEntity toEntity() {
    return EmailEntity(
        email: email, password: password, referral: referral, userId: userId);
  }

  @override
  List<Object?> get props => [email, password, referral, userId];
}
