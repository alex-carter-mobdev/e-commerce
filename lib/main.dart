import 'package:e_commerce/core/storage/auth_local_storage.dart';
import 'package:e_commerce/core/theme/router.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_bloc.dart';
import 'package:e_commerce/features/settings/viewModel/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    AuthLocalStorage().initPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
      ],

      child: MaterialApp.router(
        theme: ThemeData(fontFamily: 'Gabarito'),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
