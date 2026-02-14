import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (error) => emit(SigninFailure(message: error.message)),
      (user) => emit(SigninSuccess(user: user)),
    );
  }

  Future<void> signinWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signinwithGoogle();
    result.fold(
      (error) {
        emit(SigninFailure(message: error.message));
      },
      (user) {
        emit(SigninSuccess(user: user));
      },
    );
  }
}
