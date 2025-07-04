part of 'router.dart';

class Routes {
  static String home = '/home';
  static String signIn = '/signIn';
  static String signUp = '/signUp';
  static String resetPassword = '/resetPassword';
  static String aboutYourself = '/aboutYourself';
  static String settings = '/settings';
  static String orders = '/orders';
  static String orderItem = ':id';
  static String notifications = '/notifications';
  static String address = '/address';
  static String addressAddEdit = ':id';
  static String payments = '/payments';
  static String paymentsAddEdit = ':id';
  static String favourites = '/favourites';
  static String categories = '/categories';
  static String categoriesId = ':categoryId';
  static String products = '/products';
  static String product = '/products/:productId';
  static String search = '/search';
  static String cart = '/cart';
  static String checkout = '/checkout';
  static String selectAddress = '/selectAddress';
  static String selectPayment = '/selectPayment';
  static String topSelling = '/topSelling';
  static String newIn = '/newIn';
  static var forgotPassword = _ForgotPasswordRoutes();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _homeNavigatorKey = GlobalKey<NavigatorState>();
  static final _settingsNavigatorKey = GlobalKey<NavigatorState>();
  static final _ordersNavigatorKey = GlobalKey<NavigatorState>();
  static final _notificationsNavigatorKey = GlobalKey<NavigatorState>();
}

class _ForgotPasswordRoutes {
  _ForgotPasswordRoutes();

  final step1Page = step1_page.ForgotPasswordPage();
  final step2Page = step2_page.ForgotPasswordPage();
  final step1 = '/forgot-password/step1';
  final step2 = '/forgot-password/step2';
}
