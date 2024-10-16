import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsivedashboard/helper/helpers.dart';
import 'package:responsivedashboard/widgets/dynamic_table.dart';

class CreationPage extends StatelessWidget {
  const CreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic pageTitle = Get.arguments[0];
    final dynamic initialData = Get.arguments[1];
    final bool isEditable = Get.arguments[2] ?? false;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(pageTitle),
        //iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: DynamicTable(
          pageName: pageTitle,
        ),
      ),
    );
  }
}
