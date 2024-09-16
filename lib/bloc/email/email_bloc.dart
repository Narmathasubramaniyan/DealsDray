// lib/bloc/email/email_bloc.dart

import 'package:dealsdray/repository/email/email_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dealsdray/bloc/email/email_event.dart';
import 'package:dealsdray/bloc/email/email_state.dart';
import 'package:logger/logger.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepositoryImpl emailRepository;
  final Logger _logger = Logger();

  EmailBloc(this.emailRepository) : super(EmailInitial()) {
    on<PostEmailLoginEvent>(_onPostEmailLoginEvent);
  }

  Future<void> _onPostEmailLoginEvent(
      PostEmailLoginEvent event, Emitter<EmailState> emit) async {
    emit(EmailLoading());
    try {
      final result = await emailRepository.postEmailLogin(
        event.email,
        event.password,
        event.referralCode,
      );
      emit(EmailLoaded(result));
    } catch (e) {
      String errorMessage;
      if (e is Exception) {
        errorMessage = e.toString();
        _logger.e('Error: $errorMessage', error: e);
      } else {
        errorMessage = 'Unexpected error: $e';
        _logger.e('Unexpected error: $errorMessage', error: e);
      }
      emit(EmailError(errorMessage));
    }
  }
}
