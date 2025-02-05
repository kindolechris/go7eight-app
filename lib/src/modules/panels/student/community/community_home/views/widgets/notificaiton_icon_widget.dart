import 'package:go7eight/src/core/app_export.dart';

class NotificationIconWidget extends StatefulWidget {
  final String postID;

  const NotificationIconWidget({super.key, required this.postID});
  @override
  State<NotificationIconWidget> createState() => _NotificationIconWidgetState();
}

class _NotificationIconWidgetState extends State<NotificationIconWidget> {
  late bool _isEnabled;

  @override
  void initState() {
    _isEnabled = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isEnabled = !_isEnabled;
        });
      },
      child: Container(
        width: AppRatioSize.getRatioWidth() / 12,
        height: AppRatioSize.getRatioWidth() / 12,
        alignment: Alignment.center,
        child: Icon(
          _isEnabled
              ? Icons.notifications_rounded
              : Icons.notifications_none_rounded,
          color: AppColor.primary,
        ),
      ),
    );
  }
}
