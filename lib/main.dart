import 'package:flutter/foundation.dart';
import '/business/cubit/rukin_app_cubit.dart';
import '/shared/style/lightTheme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business/obServer.dart';
import 'modules/HomePage.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(!kReleaseMode? DevicePreview(
    builder: (context) => const MyApp(),
  ) : const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => RukinAppCubit(),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
