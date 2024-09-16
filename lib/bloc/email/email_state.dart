// lib/bloc/email/email_state.dart

import 'package:equatable/equatable.dart';

abstract class EmailState extends Equatable {
  const EmailState();

  @override
  List<Object> get props => [];
}

class EmailInitial extends EmailState {}

class EmailLoading extends EmailState {}

class EmailLoaded extends EmailState {
  final Map<String, String> result;

  const EmailLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class EmailError extends EmailState {
  final String message;

  const EmailError(this.message);

  @override
  List<Object> get props => [message];
}
