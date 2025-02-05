
import 'package:flutter/cupertino.dart';

import '../../../core/app_export.dart';

class BookmarkWidget extends StatefulWidget {
  final int id;
  const BookmarkWidget({
    super.key,
    required this.id,
  });

  @override
  State<BookmarkWidget> createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  late bool _bookmarkValue;

  @override
  void initState() {
    _bookmarkValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _bookmarkValue = !_bookmarkValue;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(top: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColor.grey.withOpacity(0.7)),
        child: Icon(
          _bookmarkValue
              ? Icons.bookmark_rounded
              : Icons.bookmark_border_rounded,
          color: AppColor.white,
          size: AppRatioSize.getRatioHeight() / 38,
        ),
      ),
    );
  }
}
