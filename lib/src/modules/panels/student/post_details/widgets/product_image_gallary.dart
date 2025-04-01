import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go7eight/src/core/constants/colors.dart';
import 'package:go7eight/src/models/post.dart';


class ProductImageGallery extends StatefulWidget {
  final Post? post;

  const ProductImageGallery({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use default images if post media is not available
    final List<String> defaultImages = [
      'https://i.imgur.com/1gGxMfw.jpg',
      'https://i.imgur.com/AQhcNkU.jpg',
      'https://i.imgur.com/XW0dBiG.jpg',
      'https://i.imgur.com/DcGpOwF.jpg',
    ];

    final bool hasPostMedia = widget.post?.media != null && widget.post!.media!.isNotEmpty;
    final int itemCount = hasPostMedia ? widget.post!.media!.length : defaultImages.length;

    return Stack(
      children: [
        // Image slider with edge-to-edge coverage
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentImageIndex = index;
              });
            },
            itemCount: itemCount,
            itemBuilder: (context, index) {
              if (hasPostMedia) {
                final media = widget.post!.media![index];
                return CachedNetworkImage(
                  imageUrl: "https://service.go7eight.com/${media.url}",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: (context, url) => Container(
                    color: AppColor.black,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColor.black,
                    child: const Center(
                      child: Icon(
                        Icons.error_outline,
                        color: AppColor.white,
                        size: 50,
                      ),
                    ),
                  ),
                );
              } else {
                return Container(
                  color: AppColor.black,
                  child: Image.network(
                    defaultImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColor.black,
                        child: const Center(child: Icon(Icons.error, color: AppColor.white)),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),

        // Image counter
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${_currentImageIndex + 1}/$itemCount',
              style: const TextStyle(
                color: AppColor.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // Image indicators
        if (itemCount > 1)
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                itemCount,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _currentImageIndex == index ? 16 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: _currentImageIndex == index
                        ? AppColor.white
                        : AppColor.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}