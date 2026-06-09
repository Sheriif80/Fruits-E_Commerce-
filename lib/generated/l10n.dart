// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// ` Welcome to `
  String get onBoardingWelcome {
    return Intl.message(
      ' Welcome to ',
      name: 'onBoardingWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide range of fresh premium fruits and get the best deals and quality.`
  String get onBoardingDescription {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide range of fresh premium fruits and get the best deals and quality.',
      name: 'onBoardingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get onBoardingSearchTitle {
    return Intl.message(
      'Search and Shop',
      name: 'onBoardingSearchTitle',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the best carefully selected fruits. View details, photos and ratings to ensure you choose the perfect fruit.`
  String get onBoardingSearchDescription {
    return Intl.message(
      'We offer you the best carefully selected fruits. View details, photos and ratings to ensure you choose the perfect fruit.',
      name: 'onBoardingSearchDescription',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get onBoardingSkip {
    return Intl.message('Skip', name: 'onBoardingSkip', desc: '', args: []);
  }

  /// `Get Started`
  String get onBoardingStart {
    return Intl.message(
      'Get Started',
      name: 'onBoardingStart',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get profileTitle {
    return Intl.message('My Account', name: 'profileTitle', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Profile Information`
  String get profileInfo {
    return Intl.message(
      'Profile Information',
      name: 'profileInfo',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message('My Orders', name: 'myOrders', desc: '', args: []);
  }

  /// `Payments`
  String get payments {
    return Intl.message('Payments', name: 'payments', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Night Mode`
  String get nightMode {
    return Intl.message('Night Mode', name: 'nightMode', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get logoutConfirmation {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get signInWithApple {
    return Intl.message(
      'Sign in with Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get signUp {
    return Intl.message('Create Account', name: 'signUp', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Create New Account`
  String get createAccount {
    return Intl.message(
      'Create New Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `You must agree to the terms and conditions`
  String get acceptTerms {
    return Intl.message(
      'You must agree to the terms and conditions',
      name: 'acceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, just enter your email and we'll send you a verification code.`
  String get forgotPasswordDescription {
    return Intl.message(
      'Don\'t worry, just enter your email and we\'ll send you a verification code.',
      name: 'forgotPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to `
  String get termsPrefix {
    return Intl.message(
      'By creating an account, you agree to ',
      name: 'termsPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions `
  String get terms {
    return Intl.message(
      'Terms and Conditions ',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `of our`
  String get termsSuffix {
    return Intl.message('of our', name: 'termsSuffix', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// ` Create One`
  String get createOne {
    return Intl.message(' Create One', name: 'createOne', desc: '', args: []);
  }

  /// `Already have an account?`
  String get haveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginNow {
    return Intl.message('Login', name: 'loginNow', desc: '', args: []);
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `You have {count} products in your cart`
  String cartItemsCount(Object count) {
    return Intl.message(
      'You have $count products in your cart',
      name: 'cartItemsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Checkout  :  {total} EGP`
  String checkout(Object total) {
    return Intl.message(
      'Checkout  :  $total EGP',
      name: 'checkout',
      desc: '',
      args: [total],
    );
  }

  /// ` No products in cart`
  String get emptyCart {
    return Intl.message(
      ' No products in cart',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `kg `
  String get kg {
    return Intl.message('kg ', name: 'kg', desc: '', args: []);
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Confirm Order`
  String get confirmOrder {
    return Intl.message(
      'Confirm Order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Pay with PayPal`
  String get payWithPaypal {
    return Intl.message(
      'Pay with PayPal',
      name: 'payWithPaypal',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Payment Successful`
  String get paymentSuccess {
    return Intl.message(
      'Payment Successful',
      name: 'paymentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get errorOccurred {
    return Intl.message(
      'Something went wrong',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Order Created!`
  String get orderCreated {
    return Intl.message(
      'Order Created!',
      name: 'orderCreated',
      desc: '',
      args: [],
    );
  }

  /// `We will contact you soon`
  String get contactMessage {
    return Intl.message(
      'We will contact you soon',
      name: 'contactMessage',
      desc: '',
      args: [],
    );
  }

  /// `Track Order`
  String get trackOrder {
    return Intl.message('Track Order', name: 'trackOrder', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Cash on Delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Price includes shipping`
  String get shippingIncluded {
    return Intl.message(
      'Price includes shipping',
      name: 'shippingIncluded',
      desc: '',
      args: [],
    );
  }

  /// `Pay with Card`
  String get payWithCard {
    return Intl.message(
      'Pay with Card',
      name: 'payWithCard',
      desc: '',
      args: [],
    );
  }

  /// `Pay with Stripe`
  String get payWithStripe {
    return Intl.message(
      'Pay with Stripe',
      name: 'payWithStripe',
      desc: '',
      args: [],
    );
  }

  /// `Free Shipping`
  String get freeShipping {
    return Intl.message(
      'Free Shipping',
      name: 'freeShipping',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get orderSummary {
    return Intl.message(
      'Order Summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal :`
  String get subtotal {
    return Intl.message('Subtotal :', name: 'subtotal', desc: '', args: []);
  }

  /// `Delivery :`
  String get delivery {
    return Intl.message('Delivery :', name: 'delivery', desc: '', args: []);
  }

  /// `{amount} EGP`
  String deliveryFee(Object amount) {
    return Intl.message(
      '$amount EGP',
      name: 'deliveryFee',
      desc: '',
      args: [amount],
    );
  }

  /// `Free`
  String get free {
    return Intl.message('Free', name: 'free', desc: '', args: []);
  }

  /// `Total :`
  String get total {
    return Intl.message('Total :', name: 'total', desc: '', args: []);
  }

  /// `Delivery Address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery Address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Order added successfully`
  String get orderAdded {
    return Intl.message(
      'Order added successfully',
      name: 'orderAdded',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Order Number : \n {orderNumber}`
  String orderNumberFull(Object orderNumber) {
    return Intl.message(
      'Order Number : \n $orderNumber',
      name: 'orderNumberFull',
      desc: '',
      args: [orderNumber],
    );
  }

  /// `Order Date : \n {orderDate}`
  String orderDateLabel(Object orderDate) {
    return Intl.message(
      'Order Date : \n $orderDate',
      name: 'orderDateLabel',
      desc: '',
      args: [orderDate],
    );
  }

  /// `Order Amount : \n {amount} EGP`
  String orderAmountLabel(Object amount) {
    return Intl.message(
      'Order Amount : \n $amount EGP',
      name: 'orderAmountLabel',
      desc: '',
      args: [amount],
    );
  }

  /// `Order Status : \n {status}`
  String orderStatusLabel(Object status) {
    return Intl.message(
      'Order Status : \n $status',
      name: 'orderStatusLabel',
      desc: '',
      args: [status],
    );
  }

  /// `Order No:  {orderNumber}`
  String orderNum(Object orderNumber) {
    return Intl.message(
      'Order No:  $orderNumber',
      name: 'orderNum',
      desc: '',
      args: [orderNumber],
    );
  }

  /// `Ordered : {date}`
  String orderPlaced(Object date) {
    return Intl.message(
      'Ordered : $date',
      name: 'orderPlaced',
      desc: '',
      args: [date],
    );
  }

  /// `Total : {amount} EGP`
  String totalAmount(Object amount) {
    return Intl.message(
      'Total : $amount EGP',
      name: 'totalAmount',
      desc: '',
      args: [amount],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Apartment, Floor`
  String get apartment {
    return Intl.message(
      'Apartment, Floor',
      name: 'apartment',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Good Morning!..`
  String get morningGreeting {
    return Intl.message(
      'Good Morning!..',
      name: 'morningGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening!..`
  String get eveningGreeting {
    return Intl.message(
      'Good Evening!..',
      name: 'eveningGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Best Seller`
  String get bestSeller {
    return Intl.message('Best Seller', name: 'bestSeller', desc: '', args: []);
  }

  /// `More...`
  String get more {
    return Intl.message('More...', name: 'more', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Organic`
  String get organic {
    return Intl.message('Organic', name: 'organic', desc: '', args: []);
  }

  /// `Non-Organic`
  String get nonOrganic {
    return Intl.message('Non-Organic', name: 'nonOrganic', desc: '', args: []);
  }

  /// `{count} Calories`
  String calories(Object count) {
    return Intl.message(
      '$count Calories',
      name: 'calories',
      desc: '',
      args: [count],
    );
  }

  /// `{count} Gram`
  String grams(Object count) {
    return Intl.message('$count Gram', name: 'grams', desc: '', args: [count]);
  }

  /// `/ Kilo`
  String get perKilo {
    return Intl.message('/ Kilo', name: 'perKilo', desc: '', args: []);
  }

  /// `Expiration`
  String get expiration {
    return Intl.message('Expiration', name: 'expiration', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Search for.......`
  String get searchHint {
    return Intl.message(
      'Search for.......',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `No favorites yet`
  String get emptyFavorites {
    return Intl.message(
      'No favorites yet',
      name: 'emptyFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get backToHome {
    return Intl.message('Back to Home', name: 'backToHome', desc: '', args: []);
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `{length} results`
  String results(Object length) {
    return Intl.message(
      '$length results',
      name: 'results',
      desc: '',
      args: [length],
    );
  }

  /// `{price} EGP / Kilo`
  String pricePerKilo(Object price) {
    return Intl.message(
      '$price EGP / Kilo',
      name: 'pricePerKilo',
      desc: '',
      args: [price],
    );
  }

  /// `{price} EGP`
  String price(Object price) {
    return Intl.message('$price EGP', name: 'price', desc: '', args: [price]);
  }

  /// `{price} EGP `
  String priceEgp(Object price) {
    return Intl.message(
      '$price EGP ',
      name: 'priceEgp',
      desc: '',
      args: [price],
    );
  }

  /// `{price} EGP`
  String priceTotal(Object price) {
    return Intl.message(
      '$price EGP',
      name: 'priceTotal',
      desc: '',
      args: [price],
    );
  }

  /// `Reviews ({count})`
  String reviewsCount(Object count) {
    return Intl.message(
      'Reviews ($count)',
      name: 'reviewsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Start searching for your products`
  String get searchStartTyping {
    return Intl.message(
      'Start searching for your products',
      name: 'searchStartTyping',
      desc: '',
      args: [],
    );
  }

  /// `No matching results found`
  String get searchNoResults {
    return Intl.message(
      'No matching results found',
      name: 'searchNoResults',
      desc: '',
      args: [],
    );
  }

  /// `Write your review...`
  String get reviewHint {
    return Intl.message(
      'Write your review...',
      name: 'reviewHint',
      desc: '',
      args: [],
    );
  }

  /// `Rate out of 10?`
  String get ratingHint {
    return Intl.message(
      'Rate out of 10?',
      name: 'ratingHint',
      desc: '',
      args: [],
    );
  }

  /// `Review submitted successfully`
  String get reviewSubmitted {
    return Intl.message(
      'Review submitted successfully',
      name: 'reviewSubmitted',
      desc: '',
      args: [],
    );
  }

  /// `Submit Review`
  String get submitReview {
    return Intl.message(
      'Submit Review',
      name: 'submitReview',
      desc: '',
      args: [],
    );
  }

  /// `Quantity cannot exceed 10`
  String get maxQuantity {
    return Intl.message(
      'Quantity cannot exceed 10',
      name: 'maxQuantity',
      desc: '',
      args: [],
    );
  }

  /// `If this email is registered, a password reset link will be sent.`
  String get passwordResetSent {
    return Intl.message(
      'If this email is registered, a password reset link will be sent.',
      name: 'passwordResetSent',
      desc: '',
      args: [],
    );
  }

  /// `Shop Now`
  String get shopNow {
    return Intl.message('Shop Now', name: 'shopNow', desc: '', args: []);
  }

  /// `Home`
  String get homeTab {
    return Intl.message('Home', name: 'homeTab', desc: '', args: []);
  }

  /// `Products`
  String get productsTab {
    return Intl.message('Products', name: 'productsTab', desc: '', args: []);
  }

  /// `Cart`
  String get cartTab {
    return Intl.message('Cart', name: 'cartTab', desc: '', args: []);
  }

  /// `Me`
  String get profileTab {
    return Intl.message('Me', name: 'profileTab', desc: '', args: []);
  }

  /// `Logged in successfully`
  String get loggedInSuccess {
    return Intl.message(
      'Logged in successfully',
      name: 'loggedInSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Registered successfully`
  String get registeredSuccess {
    return Intl.message(
      'Registered successfully',
      name: 'registeredSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Product added successfully`
  String get productAdded {
    return Intl.message(
      'Product added successfully',
      name: 'productAdded',
      desc: '',
      args: [],
    );
  }

  /// `Product removed successfully`
  String get productRemoved {
    return Intl.message(
      'Product removed successfully',
      name: 'productRemoved',
      desc: '',
      args: [],
    );
  }

  /// `Eid Offers`
  String get eidOffers {
    return Intl.message('Eid Offers', name: 'eidOffers', desc: '', args: []);
  }

  /// `25% OFF`
  String get discount25 {
    return Intl.message('25% OFF', name: 'discount25', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
