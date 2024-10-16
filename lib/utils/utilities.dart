import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsivedashboard/routes/routes_string.dart';
import 'package:responsivedashboard/util/my_box.dart';
import 'package:responsivedashboard/util/my_tile.dart';

class Utilities {
  static List<MyBox> boxes = [
    MyBox(
      boxTitle: "Users",
      icon: Icons.co_present_outlined,
      boxAction: () {
        Get.toNamed(
          Routes.formPage,
          arguments: ['user/register', <String, dynamic>{}, false],
        );
      },
    ),
    MyBox(
        boxTitle: "Permit Types",
        icon: Icons.home_work_rounded,
        boxAction: () {
          Get.toNamed(
            Routes.formPage,
            arguments: ['permitstype', <String, dynamic>{}, false],
          );
        }),
    MyBox(
        boxTitle: "Topic",
        icon: Icons.topic_rounded,
        boxAction: () {
          Get.toNamed(
            Routes.formPage,
            arguments: ['topic', <String, dynamic>{}, false],
          );
        }),
    MyBox(
        boxTitle: "Tools",
        icon: Icons.handyman_rounded,
        boxAction: () {
          Get.toNamed(
            Routes.formPage,
            arguments: ['tools', <String, dynamic>{}, false],
          );
        }),
    MyBox(
        boxTitle: "Projects",
        icon: Icons.precision_manufacturing_outlined,
        boxAction: () {
          Get.toNamed(
            Routes.formPage,
            arguments: ['Projects', <String, dynamic>{}, false],
          );
        }),
    MyBox(
        boxTitle: "Hazards",
        icon: Icons.safety_check_sharp,
        boxAction: () {
          Get.toNamed(
            Routes.formPage,
            arguments: ['hazards', <String, dynamic>{}, false],
          );
        }),
    MyBox(
        boxTitle: "PPE's",
        icon: Icons.work_rounded,
        boxAction: () {
          Get.toNamed(
            Routes.formPage,
            arguments: ['ppe', <String, dynamic>{}, false],
          );
        }),
    MyBox(
        boxTitle: "Risk Rating",
        icon: Icons.format_list_numbered_rtl_rounded,
        boxAction: () {
          Get.toNamed(
            Routes.formPage,
            arguments: ['riskRating', <String, dynamic>{}, false],
          );
        }),
    MyBox(
        boxTitle: "Roles",
        icon: Icons.manage_accounts_rounded,
        boxAction: () {
          Get.toNamed(
            Routes.formPage,
            arguments: ['role', <String, dynamic>{}, false],
          );
        }),
    MyBox(
        boxTitle: "Trade",
        icon: Icons.table_view_rounded,
        boxAction: () {
          Get.toNamed(
            Routes.formPage,
            arguments: ['trade', <String, dynamic>{}, false],
          );
        })
  ];

  static List<MyTile> myTiles = [
    MyTile(
      title: "Work Permit",
      icon: Icons.content_paste_go_rounded,
      boxAction: () {
        Get.toNamed(Routes.activityPage, arguments: ["Work Permit", "workpermit"]);
      },
    ),
    MyTile(
      title: "UA and UC",
      icon: Icons.engineering_rounded,
      boxAction: () {
        Get.toNamed(Routes.activityPage, arguments: ["UA and UC", "uauc"]);
      },
    ),
    MyTile(
      title: "TBT Meetings",
      icon: Icons.laptop_mac_rounded,
      boxAction: () {
        Get.toNamed(Routes.activityPage, arguments: ["TBT Meetings", "meeting"]);
      },
    ),
    MyTile(
      title: "Safety Induction",
      icon: Icons.content_paste_go_rounded,
      boxAction: () {Get.toNamed(Routes.activityPage, arguments: ["Safety Induction", "induction"]);},
    ),
    MyTile(
      title: "Specific Training",
      icon: Icons.on_device_training_rounded,
      boxAction: () {Get.toNamed(Routes.activityPage, arguments: ["Specific Training", "specific"]);},
    ),
    MyTile(
      title: "Incident Report",
      icon: Icons.report_problem_rounded,
      boxAction: () {Get.toNamed(Routes.activityPage, arguments: ["Incident Report", "incident"]);},
    )
  ];
}
