import 'package:e_commerce/features/auth/view/page/forgot_password/1-step/forgot_password_page.dart'
    as step1_page;
import 'package:e_commerce/features/auth/view/page/forgot_password/2-step/forgot_password_page.dart'
    as step2_page;
import 'package:e_commerce/features/auth/view/page/about_yourself/about_yourself_page.dart';
import 'package:e_commerce/features/cart/view/pages/cart_page.dart';
import 'package:e_commerce/features/categories/view/page/item/category_items_page.dart';
import 'package:e_commerce/features/categories/view/page/list/category_list_page.dart';
import 'package:e_commerce/features/checkout/view/pages/checkout/checkout_page.dart';
import 'package:e_commerce/features/checkout/view/pages/select_address/select_address_page.dart';
import 'package:e_commerce/features/checkout/view/pages/select_payment/select_payment_page.dart';
import 'package:e_commerce/features/home/view/page/home/home_page.dart';
import 'package:e_commerce/features/home/view/page/new_in/new_in_page.dart';
import 'package:e_commerce/features/home/view/page/top_sellings/top_sellings_page.dart';
import 'package:e_commerce/features/notifications/view/page/notifications_page.dart';
import 'package:e_commerce/features/orders/view/page/item/order_item_page.dart';
import 'package:e_commerce/features/orders/view/page/list/orders_page.dart';
import 'package:e_commerce/features/products/view/page/products_page.dart';
import 'package:e_commerce/features/search/view/page/search_page.dart';
import 'package:e_commerce/features/settings/view/page/address/add_edit/address_add_edit_page.dart';
import 'package:e_commerce/features/settings/view/page/address/overview/address_page.dart';
import 'package:e_commerce/features/settings/view/page/favorties/favorties_page.dart';
import 'package:e_commerce/features/settings/view/page/payments/add_edit/payments_add_edit_page.dart';
import 'package:e_commerce/features/settings/view/page/payments/overview/payments_page.dart';
import 'package:e_commerce/features/settings/view/page/settings/settings_page.dart';
import 'package:e_commerce/features/settings/view/widgets/footer_navbar.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/auth/view/page/reset_password/reset_password_page.dart';
import 'package:e_commerce/features/auth/view/page/sign_in/signin_page.dart';
import 'package:e_commerce/features/auth/view/page/sign_up/signup_page.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.signIn,
  navigatorKey: Routes._rootNavigatorKey,
  errorBuilder: (context, state) {
    return ErrorPage(error: state.error?.message);
  },
  routes: [
    GoRoute(path: Routes.signIn, builder: (context, state) => SigninPage()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpPage()),
    GoRoute(
      path: Routes.resetPassword,
      builder: (context, state) => ResetPasswordPage(),
    ),
    GoRoute(
      path: Routes.forgotPassword.step1,
      builder: (context, state) => Routes.forgotPassword.step1Page,
    ),
    GoRoute(
      path: Routes.forgotPassword.step2,
      builder: (context, state) => Routes.forgotPassword.step2Page,
    ),
    GoRoute(
      path: Routes.aboutYourself,
      builder: (context, state) => AboutYourselfPage(),
    ),

    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) => FooterNavbar(navigationShell),

      branches: [
        StatefulShellBranch(
          navigatorKey: Routes._homeNavigatorKey,
          routes: [
            GoRoute(path: Routes.home, builder: (context, state) => HomePage()),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: Routes._notificationsNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.notifications,
              builder: (context, state) => NotificationsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: Routes._ordersNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.orders,
              builder: (context, state) => OrdersPage(),
              routes: [
                GoRoute(
                  path: Routes.orderItem,
                  builder:
                      (context, state) => OrderItemPage(
                        id: state.pathParameters['id'] ?? '',
                        key: ValueKey(
                          'order_item_${state.pathParameters['id'] ?? ''}',
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: Routes._settingsNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.settings,
              builder: (context, state) => SettingsPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.address,
      builder:
          (context, state) =>
              AddressPage(querryParamerts: state.uri.queryParameters),

      routes: [
        GoRoute(
          path: Routes.addressAddEdit,
          builder:
              (context, state) => AddressAddEditPage(
                id: state.pathParameters['id'] ?? '',
                querryParameters: state.uri.queryParameters,
              ),
        ),
      ],
    ),
    GoRoute(
      path: Routes.payments,
      builder:
          (context, state) =>
              PaymentsPage(querryParamerts: state.uri.queryParameters),
      routes: [
        GoRoute(
          path: Routes.paymentsAddEdit,
          builder:
              (context, state) => PaymentsAddEditPage(
                id: state.pathParameters['id'] ?? '',
                querryParameters: state.uri.queryParameters,
              ),
        ),
      ],
    ),
    GoRoute(
      path: Routes.favourites,
      builder: (context, state) => FavortiesPage(),
    ),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => CategoryListPage(),
      routes: [
        GoRoute(
          path: Routes.categoriesId,
          builder:
              (context, state) => CategoryItemsPage(
                id: state.pathParameters['categoryId'] ?? '',
                querryParamerts: state.uri.queryParameters,
              ),
          // routes: [
          //   GoRoute(
          //     path: Routes.product,
          //     builder:
          //         (context, state) => ProductsPage(
          //           id: state.pathParameters['productId'] ?? '',
          //           querryParamerts: state.uri.queryParameters,
          //         ),
          //   ),
          // ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.checkout,
      builder:
          (context, state) =>
              CheckoutPage(querryParamerts: state.uri.queryParameters),
    ),
    GoRoute(
      path: Routes.selectAddress,
      builder: (context, state) => SelectAddressPage(),
    ),
    GoRoute(
      path: Routes.selectPayment,
      builder: (context, state) => SelectPaymentPage(),
    ),
    GoRoute(
      path: Routes.product,
      builder:
          (context, state) => ProductsPage(
            id: state.pathParameters['id'] ?? '',
            querryParamerts: state.uri.queryParameters,
          ),
    ),
    GoRoute(path: Routes.cart, builder: (context, state) => CartPage()),
    GoRoute(path: Routes.search, builder: (context, state) => SearchPage()),
    GoRoute(path: Routes.newIn, builder: (context, state) => NewInPage()),
    GoRoute(
      path: Routes.topSelling,
      builder: (context, state) => TopSellingsPage(),
    ),
  ],
);

class PageInProgress extends StatelessWidget {
  const PageInProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('We working on this page')),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.error});
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(error ?? 'Something unexpected happend')),
    );
  }
}
