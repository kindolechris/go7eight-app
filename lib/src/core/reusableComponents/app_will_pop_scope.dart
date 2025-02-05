import 'package:flutter/cupertino.dart';

class AppWillPopScope extends StatelessWidget {
  final Widget child;
  final Future<bool> Function() onPop;

  const AppWillPopScope({
    super.key,
    required this.child,
    required this.onPop
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: () async => await onPop(),
    );
  }
}