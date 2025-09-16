import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/general/loading_controller.dart';


class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoadingController loadingController = Get.find();

    return Obx(() {
      if (loadingController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container();
    });
  }
}
