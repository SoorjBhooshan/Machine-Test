import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_app/controller/auth_controller.dart';
import 'package:machine_test_app/controller/food_controller.dart';

import 'package:machine_test_app/screens/user_check_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthController()),
    ChangeNotifierProvider(create: (context) => FoodController()),
  ], child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserCheckScreen(),
    );
  }
}