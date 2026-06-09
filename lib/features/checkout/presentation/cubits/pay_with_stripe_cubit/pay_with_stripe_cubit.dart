import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/repos/checkout_repo.dart';
import 'package:meta/meta.dart';

part 'pay_with_stripe_state.dart';

class PayWithStripeCubit extends Cubit<PayWithStripeState> {
  PayWithStripeCubit({required this.checkoutRepo})
    : super(PayWithStripeInitial());

  final CheckoutRepo checkoutRepo;

  Future<void> payWithStripe({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PayWithStripeLoading());
    final result = await checkoutRepo.makePaymentWithStripe(
      paymentIntentInputModel,
    );
    result.fold(
      (failure) => emit(PayWithStripeError(message: failure.message)),
      (r) => emit(PayWithStripeSuccess()),
    );
  }
}
