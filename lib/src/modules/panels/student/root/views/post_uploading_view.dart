import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/constants/colors.dart';
import 'package:go7eight/src/core/reusableComponents/app_status_bar.dart';
import '../controllers/root_controller.dart';

class PostUploadingView extends GetView<RootController> {
  const PostUploadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStatusBar(
      statusBarColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.offWhite
          : AppColor.blackShade,
      statusBarIconBrightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      systemNavigationBarColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.offWhite
          : AppColor.blackShade,
      systemNavigationBarIconBrightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.offWhite
            : AppColor.blackShade,
        body: Stack(
          children: [
            // Back Button
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 8,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                onPressed: () => Get.back(),
              ),
            ),

            // Main Content
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Upload Status Text
                    Obx(() => Text(
                      controller.isUploading.value
                          ? 'Uploading Post'
                          : controller.uploadProgress.value == 1.0
                          ? 'Upload Complete!'
                          : 'Upload Failed',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    )),
                    const SizedBox(height: 16),

                    // Progress Indicator or Retry Button
                    Obx(() {
                      if (controller.isUploading.value || controller.uploadProgress.value == 1.0) {
                        return Column(
                          children: [
                            // Progress Indicator
                            Container(
                              width: double.infinity,
                              height: 4,
                              child: LinearProgressIndicator(
                                value: controller.uploadProgress.value,
                                backgroundColor: Theme.of(context).brightness == Brightness.light
                                    ? Colors.grey[300]
                                    : Colors.grey[800],
                                valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
                              ),
                            ),

                            // Upload Progress Percentage
                            const SizedBox(height: 8),
                            Text(
                              '${(controller.uploadProgress.value * 100).toInt()}%',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).brightness == Brightness.light
                                    ? Colors.grey[600]
                                    : Colors.grey[400],
                              ),
                            ),
                          ],
                        );
                      } else {
                        // Retry Button
                        return Column(
                          children: [
                            const SizedBox(height: 20),
                            Icon(
                              Icons.error_outline,
                              size: 48,
                              color: Theme.of(context).brightness == Brightness.light
                                  ? Colors.red[700]
                                  : Colors.red[300],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Failed to upload your post',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).brightness == Brightness.light
                                    ? Colors.grey[800]
                                    : Colors.grey[300],
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width : 250,
                              child: AppButton(
                                text: "Retry upload",
                                action: (){
                                  controller.uploadPost();
                                },
                              ),
                            )
                          ],
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}