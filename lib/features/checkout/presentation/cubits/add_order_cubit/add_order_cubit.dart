import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/core/repos/order_repos/order_repo.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:meta/meta.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());

  final OrderRepo orderRepo;

  Future<void> addOrder({required OrderInputEntity orderEntity}) async {
    emit(AddOrderLoading());
    final result = await orderRepo.addOrder(orderEntity: orderEntity);
    result.fold(
      (l) => emit(AddOrderError(message: l.toString())),
      (r) => emit(AddOrderSuccess()),
    );
  }
}
