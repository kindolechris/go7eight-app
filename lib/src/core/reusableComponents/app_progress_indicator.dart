

import 'package:flutter/cupertino.dart';
import 'package:go7eight/src/core/app_export.dart';

class AppProgressIndicator extends StatelessWidget {
  final message;
  const AppProgressIndicator({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 45,
          height: 45,
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: AppColor.primary,
              strokeWidth: 8,
              strokeCap: StrokeCap.round,
            ),
          )
        ),
        const SizedBox(height: 20,),
        Text(message ?? "Please wait..",style: const TextStyle(
            color: AppColor.black,
            fontSize: 16
        ),)
      ],
    );
  }
}
