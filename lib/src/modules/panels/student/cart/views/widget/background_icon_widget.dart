import 'package:go7eight/src/core/app_export.dart';

class BackgroundIconWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final bool isPrimary;

  const BackgroundIconWidget(
      {super.key,
      required this.isPrimary,
      required this.icon,
      required this.iconColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: 12,
          right: AppRatioSize.getRatioWidth() / 16,
          left: AppRatioSize.getRatioWidth() / 16),
      child: Row(
        mainAxisAlignment:
            isPrimary ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Container(
            height: AppRatioSize.getRatioWidth() / 12,
            width: AppRatioSize.getRatioWidth() / 12,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
        ],
      ),
    );
  }
}
