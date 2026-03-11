part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<ProductEntity> products;
  FavoritesLoaded({required this.products});
}

final class FavoritesFailure extends FavoritesState {
  final String message;
  FavoritesFailure({required this.message});
}
