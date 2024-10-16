import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsivedashboard/widgets/dynamic_form.dart';


class ActionPage extends StatelessWidget {
  const ActionPage({super.key});

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
      body: DynamicForm(
        pageName: pageTitle,
        initialData: initialData,
        isEdit: isEditable,
      ),
    );
  }
}
