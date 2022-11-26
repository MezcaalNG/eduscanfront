import 'package:eduscan/api/models/session_model.dart';
import 'package:eduscan/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // Initialize the model in the builder. That way, Provider
      // can own Counter's lifecycle, making sure to call `dispose`
      // when not needed anymore.
      create: (context) => SessionModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EDUSCAN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF012D5A),
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
      },
    );
  }
}
