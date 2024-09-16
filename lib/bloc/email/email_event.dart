// lib/bloc/email/email_event.dart

import 'package:equatable/equatable.dart';

abstract class EmailEvent extends Equatable {
  const EmailEvent();

  @override
  List<Object> get props => [];
}

class PostEmailLoginEvent extends EmailEvent {
  final String email;
  final String password;
  final int referralCode;

  const PostEmailLoginEvent({
    required this.email,
    required this.password,
    required this.referralCode,
  });

  @override
  List<Object> get props => [email, password, referralCode];
}
