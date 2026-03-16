import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/screens/login_page.dart';
import 'package:todo/screens/profile.dart';
import 'package:todo/screens/signup.dart';
import 'provider/task_provider.dart';
import 'screens/splash/splash.dart';
import 'screens/home_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://yvybwarfaecvoratqcny.supabase.co",
    anonKey: "sb_publishable_d2FN5ksXoxKBPpp1TWyNFQ_IlB4qS7R",
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
  debugShowCheckedModeBanner: false,

  routes: {
    "/login": (context) => LoginScreen(),
    "/signup": (context) => SignUpScreen(),
    "/home": (context) => const HomeScreen(),
    "/profile": (context) => const ProfileScreen(),
  },

  home: const SplashScreen(),
);
}}