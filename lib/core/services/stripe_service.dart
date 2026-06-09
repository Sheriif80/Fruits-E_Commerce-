import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fruits_e_commerce_app/core/services/api_service.dart';
import 'package:fruits_e_commerce_app/core/utils/app_end_points.dart';
import 'package:fruits_e_commerce_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  StripeService({required this.apiService});
  ApiService apiService;
  final baseUrl = 'https://api.stripe.com';
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final response = await apiService.post(
      baseUrl + AppEndPoints.createPaymentIntentStripe,
      token: dotenv.get('Stripe_Secret_Key'),
      data: paymentIntentInputModel.toJson(),
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Fruits Shop',
      ),
    );
  }

  Future<void> confirmPayment() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel,
    );
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
    await confirmPayment();
  }
}
