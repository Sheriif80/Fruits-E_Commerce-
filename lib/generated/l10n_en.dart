// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get onBoardingWelcome => ' Welcome to ';

  @override
  String get onBoardingDescription => 'Discover a unique shopping experience with FruitHUB. Explore our wide range of fresh premium fruits and get the best deals and quality.';

  @override
  String get onBoardingSearchTitle => 'Search and Shop';

  @override
  String get onBoardingSearchDescription => 'We offer you the best carefully selected fruits. View details, photos and ratings to ensure you choose the perfect fruit.';

  @override
  String get onBoardingSkip => 'Skip';

  @override
  String get onBoardingStart => 'Get Started';

  @override
  String get profileTitle => 'My Account';

  @override
  String get general => 'General';

  @override
  String get profileInfo => 'Profile Information';

  @override
  String get myOrders => 'My Orders';

  @override
  String get payments => 'Payments';

  @override
  String get favorites => 'Favorites';

  @override
  String get language => 'Language';

  @override
  String get nightMode => 'Night Mode';

  @override
  String get help => 'Help';

  @override
  String get aboutUs => 'About Us';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirmation => 'Are you sure you want to log out?';

  @override
  String get no => 'No';

  @override
  String get yes => 'Yes';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get signIn => 'Sign In';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get signInWithApple => 'Sign in with Apple';

  @override
  String get signInWithFacebook => 'Sign in with Facebook';

  @override
  String get signUp => 'Create Account';

  @override
  String get fullName => 'Full Name';

  @override
  String get createAccount => 'Create New Account';

  @override
  String get acceptTerms => 'You must agree to the terms and conditions';

  @override
  String get forgotPasswordTitle => 'Forgot Password';

  @override
  String get forgotPasswordDescription => 'Don\'t worry, just enter your email and we\'ll send you a verification code.';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get termsPrefix => 'By creating an account, you agree to ';

  @override
  String get terms => 'Terms and Conditions ';

  @override
  String get termsSuffix => 'of our';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get createOne => ' Create One';

  @override
  String get haveAccount => 'Already have an account?';

  @override
  String get loginNow => 'Login';

  @override
  String get or => 'Or';

  @override
  String get cart => 'Cart';

  @override
  String cartItemsCount(Object count) {
    return 'You have $count products in your cart';
  }

  @override
  String checkout(Object total) {
    return 'Checkout  :  $total EGP';
  }

  @override
  String get emptyCart => ' No products in cart';

  @override
  String get kg => 'kg ';

  @override
  String get shipping => 'Shipping';

  @override
  String get address => 'Address';

  @override
  String get payment => 'Payment';

  @override
  String get confirmOrder => 'Confirm Order';

  @override
  String get payWithPaypal => 'Pay with PayPal';

  @override
  String get next => 'Next';

  @override
  String get paymentSuccess => 'Payment Successful';

  @override
  String get errorOccurred => 'Something went wrong';

  @override
  String get orderCreated => 'Order Created!';

  @override
  String get contactMessage => 'We will contact you soon';

  @override
  String get trackOrder => 'Track Order';

  @override
  String get home => 'Home';

  @override
  String get cashOnDelivery => 'Cash on Delivery';

  @override
  String get shippingIncluded => 'Price includes shipping';

  @override
  String get payWithCard => 'Pay with Card';

  @override
  String get freeShipping => 'Free Shipping';

  @override
  String get orderSummary => 'Order Summary';

  @override
  String get subtotal => 'Subtotal :';

  @override
  String get delivery => 'Delivery :';

  @override
  String deliveryFee(Object amount) {
    return '$amount EGP';
  }

  @override
  String get free => 'Free';

  @override
  String get total => 'Total :';

  @override
  String get deliveryAddress => 'Delivery Address';

  @override
  String get edit => 'Edit';

  @override
  String get orderAdded => 'Order added successfully';

  @override
  String get orderDetails => 'Order Details';

  @override
  String get close => 'Close';

  @override
  String orderNumberFull(Object orderNumber) {
    return 'Order Number : \n $orderNumber';
  }

  @override
  String orderDateLabel(Object orderDate) {
    return 'Order Date : \n $orderDate';
  }

  @override
  String orderAmountLabel(Object amount) {
    return 'Order Amount : \n $amount EGP';
  }

  @override
  String orderStatusLabel(Object status) {
    return 'Order Status : \n $status';
  }

  @override
  String orderNum(Object orderNumber) {
    return 'Order No:  $orderNumber';
  }

  @override
  String orderPlaced(Object date) {
    return 'Ordered : $date';
  }

  @override
  String totalAmount(Object amount) {
    return 'Total : $amount EGP';
  }

  @override
  String get phone => 'Phone';

  @override
  String get city => 'City';

  @override
  String get apartment => 'Apartment, Floor';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get morningGreeting => 'Good Morning!..';

  @override
  String get eveningGreeting => 'Good Evening!..';

  @override
  String get bestSeller => 'Best Seller';

  @override
  String get more => 'More...';

  @override
  String get products => 'Products';

  @override
  String get reviews => 'Reviews';

  @override
  String get organic => 'Organic';

  @override
  String get nonOrganic => 'Non-Organic';

  @override
  String calories(Object count) {
    return '$count Calories';
  }

  @override
  String grams(Object count) {
    return '$count Gram';
  }

  @override
  String get perKilo => '/ Kilo';

  @override
  String get expiration => 'Expiration';

  @override
  String get search => 'Search';

  @override
  String get searchHint => 'Search for.......';

  @override
  String get emptyFavorites => 'No favorites yet';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String results(Object length) {
    return '$length results';
  }

  @override
  String pricePerKilo(Object price) {
    return '$price EGP / Kilo';
  }

  @override
  String price(Object price) {
    return '$price EGP';
  }

  @override
  String priceEgp(Object price) {
    return '$price EGP ';
  }

  @override
  String priceTotal(Object price) {
    return '$price EGP';
  }

  @override
  String reviewsCount(Object count) {
    return 'Reviews ($count)';
  }

  @override
  String get searchStartTyping => 'Start searching for your products';

  @override
  String get searchNoResults => 'No matching results found';

  @override
  String get reviewHint => 'Write your review...';

  @override
  String get ratingHint => 'Rate out of 10?';

  @override
  String get reviewSubmitted => 'Review submitted successfully';

  @override
  String get submitReview => 'Submit Review';

  @override
  String get maxQuantity => 'Quantity cannot exceed 10';

  @override
  String get passwordResetSent => 'If this email is registered, a password reset link will be sent.';

  @override
  String get shopNow => 'Shop Now';

  @override
  String get homeTab => 'Home';

  @override
  String get productsTab => 'Products';

  @override
  String get cartTab => 'Cart';

  @override
  String get profileTab => 'Me';

  @override
  String get loggedInSuccess => 'Logged in successfully';

  @override
  String get registeredSuccess => 'Registered successfully';

  @override
  String get productAdded => 'Product added successfully';

  @override
  String get productRemoved => 'Product removed successfully';

  @override
  String get eidOffers => 'Eid Offers';

  @override
  String get discount25 => '25% OFF';
}
