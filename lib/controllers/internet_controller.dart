import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection/common_widgets/internet_popup.dart';

class InternetController extends GetxController {
  //INSTANCE CREATE...
  final Connectivity connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> resultList) {
      if (resultList.isNotEmpty) {
        ConnectivityResult result = resultList.first;
        internetStatus(result);
      } else {
        internetStatus(ConnectivityResult.none);
      }
    });
  }

  void internetStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!Get.isSnackbarOpen) {
          Get.rawSnackbar(
            titleText: const Align(
              alignment: Alignment.center,
              child: InternetPopup(),
            ),
            messageText: Container(),
            backgroundColor: Colors.transparent,
            isDismissible: false,
            duration: const Duration(days: 1),
          );
        }
      });
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
