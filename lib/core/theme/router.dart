import 'package:e_commerce/features/auth/view/page/forgot_password/1-step/forgot_password_page.dart'
    as step1_page;
import 'package:e_commerce/features/auth/view/page/forgot_password/2-step/forgot_password_page.dart'
    as step2_page;
import 'package:e_commerce/features/auth/view/page/about_yourself/about_yourself_page.dart';
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
          navigatorKey: Routes._settingsNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.settings,
              builder:
                  (context, state) => Scaffold(
                    appBar: AppBar(),
                    body: Center(child: Text('We working on this page')),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: Routes._homeNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.home,
              builder:
                  (context, state) => Scaffold(
                    appBar: AppBar(),
                    body: Center(child: Text('We working on this page')),
                  ),
            ),
          ],
        ),
      ],
    ),
  ],
);
