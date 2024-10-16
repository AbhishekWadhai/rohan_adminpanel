import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsivedashboard/routes/routes.dart';
import 'package:responsivedashboard/routes/routes_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      getPages: AppRoutes.routes,
      initialRoute: Routes.loginPage,
    );
  }
}
