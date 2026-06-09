import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fruits_e_commerce_app/core/errors/api_error_handler.dart';
import 'package:fruits_e_commerce_app/core/errors/failures.dart';
import 'package:fruits_e_commerce_app/core/services/stripe_service.dart';
import 'package:fruits_e_commerce_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/repos/checkout_repo.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final StripeService stripeService;
  CheckoutRepoImpl({required this.stripeService});
  @override
  Future<Either<Failures, void>> makePaymentWithStripe(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    try {
      await stripeService.makePayment(paymentIntentInputModel);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(ApiErrorHandler.handle(e).message));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
