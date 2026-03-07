part of 'get_reviews_cubit.dart';

@immutable
sealed class GetReviewsState {}

final class GetReviewsInitial extends GetReviewsState {}

final class GetReviewsLoading extends GetReviewsState {}

final class GetReviewsSuccess extends GetReviewsState {
  final List<ReviewEntity> reviews;
  GetReviewsSuccess({required this.reviews});
}

final class GetReviewsError extends GetReviewsState {
  final String message;
  GetReviewsError({required this.message});
}
