import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.authRepo) : super(SignOutInitial());

  final AuthRepo authRepo;

  void signOut() async {
    emit(SignOutLoading());
    final result = await authRepo.signOut();
    result.fold(
      (l) => emit(SignOutFailure(message: l.message)),
      (r) => emit(SignOutSuccess()),
    );
  }
}
