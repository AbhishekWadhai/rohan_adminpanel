import 'package:get/get.dart';
import 'package:responsivedashboard/model/induction_model.dart';
import 'package:responsivedashboard/model/secific_training_model.dart';
import 'package:responsivedashboard/model/tbt_meeting.dart';
import 'package:responsivedashboard/model/uauc_model.dart';
import 'package:responsivedashboard/model/work_permit_model.dart';

import 'package:responsivedashboard/services/api_services.dart';
import 'package:responsivedashboard/services/shared_preferences.dart';

class ActivityPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxList<dynamic> activitytList = [].obs;

  @override
  void onInit() {
    super.onInit();
    print("---------------------On init called---------------------");
    getData();
  }

  getData() async {
    String t = await SharedPrefService().getString("token") ?? "";
    print(t);
  }

  getPermitData(String endpoint) async {
    try {
      final activityData = await ApiService().getRequest(endpoint);

      if (activityData == null) {
        throw Exception("Received null data from API");
      }

      // Ensure that the API response is a List of Map<String, dynamic>
      if (activityData is List) {
        // Check for any null elements in the list
        switch (endpoint) {
          case "workpermit":
            activitytList.value = activityData
                .where((e) => e != null)
                .map((e) => WorkPermit.fromJson(e as Map<String, dynamic>))
                .toList();
            break;
          case "uauc":
            activitytList.value = activityData
                .where((e) => e != null)
                .map((e) => UaUc.fromJson(e as Map<String, dynamic>))
                .toList();
            break;
          case "meeting":
            activitytList.value = activityData
                .where((e) => e != null)
                .map((e) => TbtMeeting.fromJson(e as Map<String, dynamic>))
                .toList();
            break;
          case "induction":
            activitytList.value = activityData
                .where((e) => e != null)
                .map((e) => Induction.fromJson(e as Map<String, dynamic>))
                .toList();
            break;
          case "specific":
            activitytList.value = activityData
                .where((e) => e != null)
                .map(
                    (e) => SpecificTraining.fromJson(e as Map<String, dynamic>))
                .toList();
            break;
          default:
            Get.snackbar("No Activity Detected", "Select available Activities");
        }
      } else {
        throw Exception("Unexpected data format");
      }

      print("---------------------Permit called---------------------");
      print("Permit List Length: ${activitytList.length}");
    } catch (e) {
      print("Error fetching permit data: $e");
      // Handle the error accordingly, e.g., show a dialog or retry
    }
  }

  deleteActivity(String endpoint, String key) async {
    await ApiService().deleteRequest(endpoint, key);
    getPermitData(endpoint);
  }
}
