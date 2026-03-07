import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/core/entities/review_entity.dart';
import 'package:fruits_e_commerce_app/features/products/domain/repos/reviews_repo.dart';
import 'package:meta/meta.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit(this._reviewsRepo) : super(AddReviewInitial());
  final ReviewsRepo _reviewsRepo;

  Future<void> addReview({
    required String productCode,
    required ReviewEntity review,
  }) async {
    emit(AddReviewLoading());
    final result = await _reviewsRepo.addReview(
      productCode: productCode,
      review: review,
    );
    result.fold(
      (l) => emit(AddReviewError(message: l.message)),
      (r) => emit(AddReviewSuccess()),
    );
  }
}
