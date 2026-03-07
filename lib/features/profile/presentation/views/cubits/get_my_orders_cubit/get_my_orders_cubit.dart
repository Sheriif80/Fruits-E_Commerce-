import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/core/repos/order_repos/order_repo.dart';
import 'package:fruits_e_commerce_app/features/profile/domain/entities/my_orders_entity.dart';
import 'package:meta/meta.dart';

part 'get_my_orders_state.dart';

class GetMyOrdersCubit extends Cubit<GetMyOrdersState> {
  GetMyOrdersCubit(this._orderRepo) : super(GetMyOrdersInitial());
  final OrderRepo _orderRepo;

  void getMyOrders({required String userID}) async {
    emit(GetMyOrdersLoading());
    final result = await _orderRepo.getMyOrders(userID: userID);
    result.fold(
      (l) => emit(GetMyOrdersFailure(message: l.message)),
      (r) => emit(GetMyOrdersSuccess(myOrders: r)),
    );
  }
}
