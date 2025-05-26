import 'package:e_commerce/core/storage/auth_local_storage.dart';
import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_bloc.dart';
import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthLocalStorage().initPrefs();
  await dotenv.load(fileName: ".env");
  logger.i('env loaded');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => User()),
      ],

      child: MaterialApp.router(
        theme: ThemeData(fontFamily: 'Gabarito'),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
