import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class InitialState extends LoginState {}

class LoadingState extends LoginState {}

class SuccessState extends LoginState {
  final String successResponse; // Response message

  const SuccessState({required this.successResponse});

  @override
  List<Object?> get props => [successResponse];
}

class FailureState extends LoginState {
  final String errorMessage; // Error message

  const FailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
