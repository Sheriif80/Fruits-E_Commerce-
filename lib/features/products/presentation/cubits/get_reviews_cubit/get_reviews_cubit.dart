import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/features/products/domain/entities/review_entity.dart';
import 'package:fruits_e_commerce_app/features/products/domain/repos/reviews_repo.dart';
import 'package:meta/meta.dart';

part 'get_reviews_state.dart';

class GetReviewsCubit extends Cubit<GetReviewsState> {
  GetReviewsCubit(this._reviewsRepo) : super(GetReviewsInitial());
  final ReviewsRepo _reviewsRepo;

  Future<void> getReviews({required String productCode}) async {
    emit(GetReviewsLoading());
    final result = await _reviewsRepo.getReviews(productCode);
    result.fold(
      (l) => emit(GetReviewsError(message: l.message)),
      (r) => emit(GetReviewsSuccess(reviews: r)),
    );
  }
}
