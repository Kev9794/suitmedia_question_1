import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_question_1/view/pages/home.dart';
import 'package:suitmedia_question_1/core/utils/injector.dart' as di;

import 'core/utils/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Providers.init,
      child: MaterialApp(
        title: 'SuitMedia Question 1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2B637B)),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
