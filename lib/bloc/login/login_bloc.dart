import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dealsdray/repository/login/login_repo.dart';
import 'package:dealsdray/bloc/login/login_event.dart';
import 'package:dealsdray/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo;

  LoginBloc(this.loginRepo) : super(InitialState()) {
    on<PostMobileNumber>(_postMobileNumber);
  }

  Future<void> _postMobileNumber(
      PostMobileNumber event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    try {
      final response = await loginRepo.postMobileNumber(event.phoneNumber);
      final message = response['message'] ?? 'Unknown error occurred';

      if (message.contains('Phone number not registered')) {
        emit(FailureState(errorMessage: message));
      } else {
        emit(SuccessState(successResponse: message));
      }
    } catch (e) {
      emit(const FailureState(
          errorMessage: 'Not registered, please register via email'));
    }
  }
}
