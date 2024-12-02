import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection/internet_popup.dart';

class InternetController extends GetxController {
  final Connectivity connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    print("InternetController initialized");
    connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> resultList) {
      if (resultList.isNotEmpty) {
        ConnectivityResult result = resultList.first;
        _updateNetworkStatus(result);
      } else {
        _updateNetworkStatus(ConnectivityResult.none);
      }
    });
  }

  void _updateNetworkStatus(ConnectivityResult result) {
    print("Network status changed: $result");

    if (result == ConnectivityResult.none) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!Get.isSnackbarOpen) {
          print("Showing snackbar for no internet connection");
          Get.rawSnackbar(
            titleText: SizedBox(
              width: double.infinity,
              height: Get.size.height / 1.1,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: NoInternetConnection(),
              ),
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
        print("Closing the snackbar");
        Get.closeCurrentSnackbar();
      }
    }
  }
}
