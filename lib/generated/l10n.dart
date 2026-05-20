import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ar.dart';
import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @onBoardingWelcome.
  ///
  /// In en, this message translates to:
  /// **' Welcome to '**
  String get onBoardingWelcome;

  /// No description provided for @onBoardingDescription.
  ///
  /// In en, this message translates to:
  /// **'Discover a unique shopping experience with FruitHUB. Explore our wide range of fresh premium fruits and get the best deals and quality.'**
  String get onBoardingDescription;

  /// No description provided for @onBoardingSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Search and Shop'**
  String get onBoardingSearchTitle;

  /// No description provided for @onBoardingSearchDescription.
  ///
  /// In en, this message translates to:
  /// **'We offer you the best carefully selected fruits. View details, photos and ratings to ensure you choose the perfect fruit.'**
  String get onBoardingSearchDescription;

  /// No description provided for @onBoardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onBoardingSkip;

  /// No description provided for @onBoardingStart.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onBoardingStart;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get profileTitle;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @profileInfo.
  ///
  /// In en, this message translates to:
  /// **'Profile Information'**
  String get profileInfo;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @nightMode.
  ///
  /// In en, this message translates to:
  /// **'Night Mode'**
  String get nightMode;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmation;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @signInWithApple.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get signInWithApple;

  /// No description provided for @signInWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Facebook'**
  String get signInWithFacebook;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get signUp;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get createAccount;

  /// No description provided for @acceptTerms.
  ///
  /// In en, this message translates to:
  /// **'You must agree to the terms and conditions'**
  String get acceptTerms;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry, just enter your email and we\'ll send you a verification code.'**
  String get forgotPasswordDescription;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @termsPrefix.
  ///
  /// In en, this message translates to:
  /// **'By creating an account, you agree to '**
  String get termsPrefix;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions '**
  String get terms;

  /// No description provided for @termsSuffix.
  ///
  /// In en, this message translates to:
  /// **'of our'**
  String get termsSuffix;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @createOne.
  ///
  /// In en, this message translates to:
  /// **' Create One'**
  String get createOne;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccount;

  /// No description provided for @loginNow.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginNow;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @cartItemsCount.
  ///
  /// In en, this message translates to:
  /// **'You have {count} products in your cart'**
  String cartItemsCount(Object count);

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout  :  {total} EGP'**
  String checkout(Object total);

  /// No description provided for @emptyCart.
  ///
  /// In en, this message translates to:
  /// **' No products in cart'**
  String get emptyCart;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'kg '**
  String get kg;

  /// No description provided for @shipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get shipping;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @confirmOrder.
  ///
  /// In en, this message translates to:
  /// **'Confirm Order'**
  String get confirmOrder;

  /// No description provided for @payWithPaypal.
  ///
  /// In en, this message translates to:
  /// **'Pay with PayPal'**
  String get payWithPaypal;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @paymentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment Successful'**
  String get paymentSuccess;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorOccurred;

  /// No description provided for @orderCreated.
  ///
  /// In en, this message translates to:
  /// **'Order Created!'**
  String get orderCreated;

  /// No description provided for @contactMessage.
  ///
  /// In en, this message translates to:
  /// **'We will contact you soon'**
  String get contactMessage;

  /// No description provided for @trackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrder;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get cashOnDelivery;

  /// No description provided for @shippingIncluded.
  ///
  /// In en, this message translates to:
  /// **'Price includes shipping'**
  String get shippingIncluded;

  /// No description provided for @payWithCard.
  ///
  /// In en, this message translates to:
  /// **'Pay with Card'**
  String get payWithCard;

  /// No description provided for @freeShipping.
  ///
  /// In en, this message translates to:
  /// **'Free Shipping'**
  String get freeShipping;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummary;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal :'**
  String get subtotal;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery :'**
  String get delivery;

  /// No description provided for @deliveryFee.
  ///
  /// In en, this message translates to:
  /// **'{amount} EGP'**
  String deliveryFee(Object amount);

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total :'**
  String get total;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get deliveryAddress;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @orderAdded.
  ///
  /// In en, this message translates to:
  /// **'Order added successfully'**
  String get orderAdded;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @orderNumberFull.
  ///
  /// In en, this message translates to:
  /// **'Order Number : \n {orderNumber}'**
  String orderNumberFull(Object orderNumber);

  /// No description provided for @orderDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Order Date : \n {orderDate}'**
  String orderDateLabel(Object orderDate);

  /// No description provided for @orderAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Order Amount : \n {amount} EGP'**
  String orderAmountLabel(Object amount);

  /// No description provided for @orderStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Order Status : \n {status}'**
  String orderStatusLabel(Object status);

  /// No description provided for @orderNum.
  ///
  /// In en, this message translates to:
  /// **'Order No:  {orderNumber}'**
  String orderNum(Object orderNumber);

  /// No description provided for @orderPlaced.
  ///
  /// In en, this message translates to:
  /// **'Ordered : {date}'**
  String orderPlaced(Object date);

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total : {amount} EGP'**
  String totalAmount(Object amount);

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @apartment.
  ///
  /// In en, this message translates to:
  /// **'Apartment, Floor'**
  String get apartment;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @morningGreeting.
  ///
  /// In en, this message translates to:
  /// **'Good Morning!..'**
  String get morningGreeting;

  /// No description provided for @eveningGreeting.
  ///
  /// In en, this message translates to:
  /// **'Good Evening!..'**
  String get eveningGreeting;

  /// No description provided for @bestSeller.
  ///
  /// In en, this message translates to:
  /// **'Best Seller'**
  String get bestSeller;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More...'**
  String get more;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @organic.
  ///
  /// In en, this message translates to:
  /// **'Organic'**
  String get organic;

  /// No description provided for @nonOrganic.
  ///
  /// In en, this message translates to:
  /// **'Non-Organic'**
  String get nonOrganic;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'{count} Calories'**
  String calories(Object count);

  /// No description provided for @grams.
  ///
  /// In en, this message translates to:
  /// **'{count} Gram'**
  String grams(Object count);

  /// No description provided for @perKilo.
  ///
  /// In en, this message translates to:
  /// **'/ Kilo'**
  String get perKilo;

  /// No description provided for @expiration.
  ///
  /// In en, this message translates to:
  /// **'Expiration'**
  String get expiration;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for.......'**
  String get searchHint;

  /// No description provided for @emptyFavorites.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get emptyFavorites;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'{length} results'**
  String results(Object length);

  /// No description provided for @pricePerKilo.
  ///
  /// In en, this message translates to:
  /// **'{price} EGP / Kilo'**
  String pricePerKilo(Object price);

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'{price} EGP'**
  String price(Object price);

  /// No description provided for @priceEgp.
  ///
  /// In en, this message translates to:
  /// **'{price} EGP '**
  String priceEgp(Object price);

  /// No description provided for @priceTotal.
  ///
  /// In en, this message translates to:
  /// **'{price} EGP'**
  String priceTotal(Object price);

  /// No description provided for @reviewsCount.
  ///
  /// In en, this message translates to:
  /// **'Reviews ({count})'**
  String reviewsCount(Object count);

  /// No description provided for @searchStartTyping.
  ///
  /// In en, this message translates to:
  /// **'Start searching for your products'**
  String get searchStartTyping;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No matching results found'**
  String get searchNoResults;

  /// No description provided for @reviewHint.
  ///
  /// In en, this message translates to:
  /// **'Write your review...'**
  String get reviewHint;

  /// No description provided for @ratingHint.
  ///
  /// In en, this message translates to:
  /// **'Rate out of 10?'**
  String get ratingHint;

  /// No description provided for @reviewSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Review submitted successfully'**
  String get reviewSubmitted;

  /// No description provided for @submitReview.
  ///
  /// In en, this message translates to:
  /// **'Submit Review'**
  String get submitReview;

  /// No description provided for @maxQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity cannot exceed 10'**
  String get maxQuantity;

  /// No description provided for @passwordResetSent.
  ///
  /// In en, this message translates to:
  /// **'If this email is registered, a password reset link will be sent.'**
  String get passwordResetSent;

  /// No description provided for @shopNow.
  ///
  /// In en, this message translates to:
  /// **'Shop Now'**
  String get shopNow;

  /// No description provided for @homeTab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTab;

  /// No description provided for @productsTab.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productsTab;

  /// No description provided for @cartTab.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cartTab;

  /// No description provided for @profileTab.
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get profileTab;

  /// No description provided for @loggedInSuccess.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get loggedInSuccess;

  /// No description provided for @registeredSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registered successfully'**
  String get registeredSuccess;

  /// No description provided for @productAdded.
  ///
  /// In en, this message translates to:
  /// **'Product added successfully'**
  String get productAdded;

  /// No description provided for @productRemoved.
  ///
  /// In en, this message translates to:
  /// **'Product removed successfully'**
  String get productRemoved;

  /// No description provided for @eidOffers.
  ///
  /// In en, this message translates to:
  /// **'Eid Offers'**
  String get eidOffers;

  /// No description provided for @discount25.
  ///
  /// In en, this message translates to:
  /// **'25% OFF'**
  String get discount25;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return SAr();
    case 'en': return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

