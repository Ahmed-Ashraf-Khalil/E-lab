import 'package:e_lab/presentation/controller/cubit.dart';
import 'package:e_lab/presentation/controller/state.dart';
import 'package:e_lab/presentation/screens/layout.dart';
import 'package:e_lab/presentation/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_theme/dark_theme.dart';
import 'core/app_theme/light_theme.dart';
import 'core/services/services_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ServicesLocator().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var user  = FirebaseAuth.instance.currentUser;

    return BlocProvider(
      create: (BuildContext context)=>ElabCubit(),
      child: BlocConsumer<ElabCubit,MainState>(
        listener: (context,state){},
        builder: (context,state) {
          ElabCubit.get(context).getBoolValue();
          return MaterialApp(
          title: "E-Lab",
          debugShowCheckedModeBanner: false,
          theme: buildLightTheme(),
          darkTheme: buildDarkTheme(),
          themeMode: ElabCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
          home: user == null ? const LoginScreen() : const AppLayout(),
        );
        },
      ),
    );
  }
}
