part of 'pay_with_stripe_cubit.dart';

@immutable
sealed class PayWithStripeState {}

final class PayWithStripeInitial extends PayWithStripeState {}

final class PayWithStripeLoading extends PayWithStripeState {}

final class PayWithStripeError extends PayWithStripeState {
  final String message;
  PayWithStripeError({required this.message});
}

final class PayWithStripeSuccess extends PayWithStripeState {}
