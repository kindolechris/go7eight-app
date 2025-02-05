import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:go7eight/src/core/app_export.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    required this.url,
    required this.dataSourceType,
    required this.aspectRatio,
    required this.thumbnail,
  });
  final String url;
  final String thumbnail;
  final DataSourceType dataSourceType;
  final double aspectRatio;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.url));
        break;
      case DataSourceType.file:
        _videoPlayerController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }

    _videoPlayerController.initialize().then(
          (_) => setState(() {
            _chewieController = ChewieController(
                videoPlayerController: _videoPlayerController,
                aspectRatio: widget.aspectRatio,
                autoPlay: true,
                startAt: const Duration(seconds: 0));
          }),
        );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: (_videoPlayerController.value.isInitialized)
              ? AspectRatio(
                  aspectRatio: widget.aspectRatio,
                  child: Chewie(controller: _chewieController),
                )
              : AspectRatio(
                  aspectRatio: widget.aspectRatio,
                  child: Stack(
                    children: [
                      AppNetworkImage(
                        imagePath: widget.thumbnail,
                        height: Get.height / 3,
                        width: Get.width,
                        borderRadius: 12,
                      ),
                      Center(
                          child: CircularProgressIndicator(
                        color: AppColor.white.withOpacity(0.8),
                      ))
                    ],
                  ),
                )),
    );
  }
}
