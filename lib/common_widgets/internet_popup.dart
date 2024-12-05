import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetPopup extends StatelessWidget {
  const InternetPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: Get.width / 1.2,
            height: 200,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black12,
              ),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.wifi,
                  color: Colors.red,
                  size: 40,
                ),
                Text(
                  'Whoops!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'No Internet Connection found. \nCheck your connection & try again.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
