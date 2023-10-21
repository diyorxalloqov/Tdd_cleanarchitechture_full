import 'package:flutter/material.dart';
import 'package:tdd_cached_clean_architechture_full_/core/singleton/service_locator.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/presentation/ui/homePage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
