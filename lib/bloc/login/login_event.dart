import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostMobileNumber extends LoginEvent {
  final String phoneNumber;

  PostMobileNumber({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}
