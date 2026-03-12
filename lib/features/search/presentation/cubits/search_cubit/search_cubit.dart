import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/utils/debouncer.dart';
import 'package:fruits_e_commerce_app/features/search/domain/repos/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  Future<void> searchProducts({required String query}) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    _debouncer.run(() async {
      emit(SearchLoading());
      final result = await searchRepo.searchProducts(query: query);
      result.fold(
        (l) => emit(SearchError(message: l.message)),
        (r) => emit(SearchSuccess(products: r)),
      );
    });
  }
}
