import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._authRepo) : super(ResetPasswordInitial());

  final AuthRepo _authRepo;

  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    final result = await _authRepo.sendPasswordResetEmail(email);
    result.fold(
      (error) => emit(ResetPasswordFailure(message: error.message)),
      (message) => emit(ResetPasswordSuccess()),
    );
  }
}
