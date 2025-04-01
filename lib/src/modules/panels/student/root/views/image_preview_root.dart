import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go7eight/src/core/constants/colors.dart';
import 'package:go7eight/src/core/reusableComponents/app_status_bar.dart';
import '../controllers/root_controller.dart';

class ImagePreviewView extends GetView<RootController> {
  final PageController pageController = PageController();
  final TextEditingController captionController = TextEditingController();

  ImagePreviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final screenHeight = MediaQuery.of(context).size.height;
    // Calculate image height (you can adjust these values)
    final imageHeight = screenHeight * 0.7;  // 70% of screen height

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: AppStatusBar(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        child: Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: false, // Prevent resize on keyboard
          body: Stack(
            children: [
              // Main Content
              Column(
                children: [
                  // Top Bar with Icons
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: 56,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () => Get.back(),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.refresh_rounded, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.text_fields, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Image Preview Area with Fixed Height
                  SizedBox(
                    height: imageHeight,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: controller.selectedImages.length,
                      onPageChanged: (index) {
                        controller.currentImageIndex.value = index;
                      },
                      itemBuilder: (context, index) {
                        final imagePath = controller.selectedImages[index].path;
                        return Image.file(
                          File(imagePath),
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                ],
              ),

              // Caption Input at Bottom
              Positioned(
                bottom: keyboardHeight,  // Move up with keyboard
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.0),
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Caption TextField
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: captionController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: 'Add a caption...',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                onChanged: (value) => controller.postCaption.value = value,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.alternate_email, color: Colors.white70),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),

                      // Status Counter and Send Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Go7Eight Post',
                                    style: const TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            FloatingActionButton(
                              onPressed: () => controller.handleNextPressed(),
                              backgroundColor: AppColor.primary,
                              child: const Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}