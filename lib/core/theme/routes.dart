import 'package:e_commerce/features/auth/view/page/about_yourself/about_yourself_page.dart';
import 'package:e_commerce/features/auth/view/page/forgot_password/1-step/forgot_password_page.dart'
    as step1_page;
import 'package:e_commerce/features/auth/view/page/forgot_password/2-step/forgot_password_page.dart'
    as step2_page;
import 'package:flutter/material.dart';
import 'package:e_commerce/features/auth/view/page/reset_password/reset_password_page.dart';
import 'package:e_commerce/features/auth/view/page/sign_in/signin_page.dart';
import 'package:e_commerce/features/auth/view/page/sign_up/signup_page.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String home = '/home';
  static String signIn = '/signIn';
  static String signUp = '/signUp';
  static String resetPassword = '/resetPassword';
  static String aboutYourself = '/aboutYourself';
  static var forgotPassword = _ForgotPasswordRoutes();
  static GoRouter router = GoRouter(
    initialLocation: signIn,
    routes: <RouteBase>[
      GoRoute(
        name: home,
        path: home,
        builder:
            (context, state) => Scaffold(
              appBar: AppBar(),
              body: Center(child: Text('We working on this page')),
            ),
      ),
      GoRoute(
        name: signIn,
        path: signIn,
        builder: (context, state) => SigninPage(),
      ),
      GoRoute(
        name: signUp,
        path: signUp,
        builder: (context, state) => SignUpPage(),
      ),
      GoRoute(
        name: resetPassword,
        path: resetPassword,
        builder: (context, state) => ResetPasswordPage(),
      ),
      GoRoute(
        name: forgotPassword.step1,
        path: forgotPassword.step1,
        builder: (context, state) => forgotPassword.step1Page,
      ),
      GoRoute(
        name: forgotPassword.step2,
        path: forgotPassword.step2,
        builder: (context, state) => forgotPassword.step2Page,
      ),
      GoRoute(
        name: aboutYourself,
        path: aboutYourself,
        builder: (context, state) => AboutYourselfPage(),
      ),
    ],
  );
}

class _ForgotPasswordRoutes {
  _ForgotPasswordRoutes();

  final step1Page = step1_page.ForgotPasswordPage();
  final step2Page = step2_page.ForgotPasswordPage();
  final step1 = '/forgot-password/step1';
  final step2 = '/forgot-password/step2';
}
