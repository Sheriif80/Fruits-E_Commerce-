// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SAr extends S {
  SAr([String locale = 'ar']) : super(locale);

  @override
  String get onBoardingWelcome => ' مرحبًا بك في ';

  @override
  String get onBoardingDescription => 'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.';

  @override
  String get onBoardingSearchTitle => 'ابحث وتسوق';

  @override
  String get onBoardingSearchDescription => 'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية';

  @override
  String get onBoardingSkip => 'تخط';

  @override
  String get onBoardingStart => 'ابدأ الان';

  @override
  String get profileTitle => 'حسابي';

  @override
  String get general => 'عام';

  @override
  String get profileInfo => 'الملف الشخصي';

  @override
  String get myOrders => 'طلباتي';

  @override
  String get payments => 'المدفوعات';

  @override
  String get favorites => 'المفضلة';

  @override
  String get language => 'اللغة';

  @override
  String get nightMode => 'الوضع الليلي';

  @override
  String get help => 'المساعدة';

  @override
  String get aboutUs => 'من نحن';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get logoutConfirmation => 'هل انت متأكد من تسجيل الخروج؟';

  @override
  String get no => 'لا';

  @override
  String get yes => 'نعم';

  @override
  String get login => 'تسجيل دخول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signInWithGoogle => 'تسجيل بواسطة جوجل';

  @override
  String get signInWithApple => 'تسجيل بواسطة أبل';

  @override
  String get signInWithFacebook => 'تسجيل بواسطة فيسبوك';

  @override
  String get signUp => 'حساب جديد';

  @override
  String get fullName => 'الاسم كاملاً';

  @override
  String get createAccount => 'إنشاء حساب جديد';

  @override
  String get acceptTerms => 'يجب الموافقة على الشروط والأحكام';

  @override
  String get forgotPasswordTitle => 'نسيت كلمة المرور';

  @override
  String get forgotPasswordDescription => 'لا تقلق ، ما عليك سوى كتابة بريدك الالكتروني وسنرسل رمز التحقق.';

  @override
  String get enterEmail => 'ادخل بريدك الالكتروني';

  @override
  String get termsPrefix => 'من خلال إنشاء حساب ، فإنك توافق على ';

  @override
  String get terms => 'الشروط والأحكام ';

  @override
  String get termsSuffix => 'الخاصة بنا';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get createOne => ' قم بانشاء حساب';

  @override
  String get haveAccount => 'تمتلك حساب بالفعل ؟';

  @override
  String get loginNow => 'تسجيل الدخول';

  @override
  String get or => 'أو';

  @override
  String get cart => 'السلة';

  @override
  String cartItemsCount(Object count) {
    return 'لديك $count منتجات في سله التسوق';
  }

  @override
  String checkout(Object total) {
    return 'الدفع الان  :  $total جنيه';
  }

  @override
  String get emptyCart => ' لا يوجد منتجات في السلة';

  @override
  String get kg => 'كم ';

  @override
  String get shipping => 'الشحن';

  @override
  String get address => 'العنوان';

  @override
  String get payment => 'الدفع';

  @override
  String get confirmOrder => 'تأكيد الطلب';

  @override
  String get payWithPaypal => 'الدفع بواسطة PayPal';

  @override
  String get next => 'التالي';

  @override
  String get paymentSuccess => 'تم الدفع بنجاح';

  @override
  String get errorOccurred => 'حدث خطأ ما';

  @override
  String get orderCreated => 'تم بنجاح !';

  @override
  String get contactMessage => 'سيتم التواصل معك في أقرب وقت';

  @override
  String get trackOrder => 'تتبع الطلب';

  @override
  String get home => 'الرئيسية';

  @override
  String get cashOnDelivery => 'الدفع عند الاستلام';

  @override
  String get shippingIncluded => 'السعر يشمل مصاريف الشحن';

  @override
  String get payWithCard => 'الدفع باستخدام البطاقة البنكية';

  @override
  String get freeShipping => 'الشحن مجاني';

  @override
  String get orderSummary => 'ملخص الطلب';

  @override
  String get subtotal => 'المجموع الفرعي :';

  @override
  String get delivery => 'ألتوصيل :';

  @override
  String deliveryFee(Object amount) {
    return '$amount جنيه';
  }

  @override
  String get free => 'مجانا';

  @override
  String get total => 'المجموع الكلي :';

  @override
  String get deliveryAddress => 'عنوان التوصيل';

  @override
  String get edit => 'تعديل';

  @override
  String get orderAdded => 'تم اضافة الطلب بنجاح';

  @override
  String get orderDetails => 'تفاصيل الطلب';

  @override
  String get close => 'اغلاق';

  @override
  String orderNumberFull(Object orderNumber) {
    return 'رقم الطلب بالكامل : \n $orderNumber';
  }

  @override
  String orderDateLabel(Object orderDate) {
    return 'تاريخ الطلب : \n $orderDate';
  }

  @override
  String orderAmountLabel(Object amount) {
    return 'قيمة الطلب : \n $amount جنيه';
  }

  @override
  String orderStatusLabel(Object status) {
    return 'حالة الطلب : \n $status';
  }

  @override
  String orderNum(Object orderNumber) {
    return 'طلب رقم:  $orderNumber';
  }

  @override
  String orderPlaced(Object date) {
    return 'تم الطلب : $date';
  }

  @override
  String totalAmount(Object amount) {
    return 'الاجمالي : $amount جنيه';
  }

  @override
  String get phone => 'رقم الهاتف';

  @override
  String get city => 'المدينة';

  @override
  String get apartment => 'رقم الطابق ,, الشقة';

  @override
  String get addToCart => 'اضافة الى السلة';

  @override
  String get morningGreeting => 'صباح الخير !..';

  @override
  String get eveningGreeting => 'مساء الخير !..';

  @override
  String get bestSeller => 'الأكثر مبيعًا';

  @override
  String get more => 'المزيد...';

  @override
  String get products => 'المنتجات';

  @override
  String get reviews => 'المراجعات';

  @override
  String get organic => 'اورجانيك';

  @override
  String get nonOrganic => 'مش اورجانيك';

  @override
  String calories(Object count) {
    return '$count كالوري';
  }

  @override
  String grams(Object count) {
    return '$count جرام';
  }

  @override
  String get perKilo => '/ الكيلو';

  @override
  String get expiration => 'الصلاحية';

  @override
  String get search => 'البحث';

  @override
  String get searchHint => 'ابحث عن.......';

  @override
  String get emptyFavorites => 'لا يوجد منتجات في المفضلة';

  @override
  String get backToHome => 'العودة الرئيسية';

  @override
  String get fieldRequired => 'هذا الحقل مطلوب';

  @override
  String results(Object length) {
    return '$length نتائج';
  }

  @override
  String pricePerKilo(Object price) {
    return '$price جنية / الكيلو';
  }

  @override
  String price(Object price) {
    return '$price جنيه';
  }

  @override
  String priceEgp(Object price) {
    return '$price جنية ';
  }

  @override
  String priceTotal(Object price) {
    return '$price جنيه';
  }

  @override
  String reviewsCount(Object count) {
    return 'المراجعات ($count)';
  }

  @override
  String get searchStartTyping => 'ابدأ بالبحث عن منتجاتك';

  @override
  String get searchNoResults => 'لا يوجد نتائج مطابقة للبحث';

  @override
  String get reviewHint => 'اكتب تعليقك...';

  @override
  String get ratingHint => 'كم من 10 ؟';

  @override
  String get reviewSubmitted => 'تم ارسال التقييم بنجاح';

  @override
  String get submitReview => 'ارسال التقييم';

  @override
  String get maxQuantity => 'لا يمكن أن يكون الكمية أكثر من 10';

  @override
  String get passwordResetSent => 'إذا كان هذا البريد الإلكتروني مسجلاً لدينا، سيتم إرسال رابط إعادة تعيين كلمة المرور.';

  @override
  String get shopNow => 'تسوق الان';

  @override
  String get homeTab => 'الرئيسية';

  @override
  String get productsTab => 'المنتجات';

  @override
  String get cartTab => 'السلة';

  @override
  String get profileTab => 'أنا';

  @override
  String get loggedInSuccess => 'تم تسجيل الدخول بنجاح';

  @override
  String get registeredSuccess => 'تم التسجيل بنجاح';

  @override
  String get productAdded => 'تم اضافة المنتج بنجاح';

  @override
  String get productRemoved => 'تم حذف المنتج بنجاح';

  @override
  String get eidOffers => 'عروض العيد';

  @override
  String get discount25 => 'خصم 25%';
}
